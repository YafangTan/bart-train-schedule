<?php
/**************************************************************************************************
routeTimes.php
    When user selects a specific station on a route (via radio button), 
    that submits a AJAX POST request to this file. 
    This file will query the BART API for next 4 arrival / departure times, 
    and output HTML to display those times.
***************************************************************************************************/
require_once('helpers.php');              
include('database_class.php');                                                          
$db = new Database;     

if (isset($_POST)) {                                // check if POST AJAX request was sent...
    $routeNumber    = (int) $_POST['rtNum'];        // store the user's route #
    $stopNumber     = (int) $_POST['stopNum'];      // store the user's stop #
    $prevStopNumber = (int) $_POST['prevStop'];     // store the previous stop #
    $nextStopNumber = (int) $_POST['nextStop'];     // store the next stop #
    $nowNextStop = [];                              // this array will store the station names of current, previous, next stops

    // Query for the route's last stop
    $db->prepare("SELECT rt_num_station FROM routeinfo WHERE rt_num=?", [$routeNumber]);  
    $db->execute();

    while ($fetch = $db->fetchRow() ) {
        $lastStop = $fetch['rt_num_station'];
    }

    // If we have stops 0-25, SQL reports back '26'.  Need to decrement.
    $lastStop--;    
    
    // if user clicks on stop 0, there can't be any previous stops.  
    // Set to NULL. This'll decide later if HTML needs to be generated for arrivals from previous stops.
    if ( $stopNumber == 0 ) {                   
        $prevStopNumber = NULL;
    }
    // else if user clicks on the last stop, there can't be any next stops.  
    // Set to NULL. This'll decide later if HTML needs to be generated for departures to next stops.
    else if ($stopNumber == $lastStop ) {       
        $nextStopNumber = NULL; 
    }
    
    // Query for data of current / next / previous stops
    $db->prepare("(SELECT * FROM stations WHERE rt_num=? AND rt_stop_pos=?)     
                  UNION 
                  (SELECT * FROM stations WHERE rt_num=? AND rt_stop_pos=?)
                  UNION 
                  (SELECT * FROM stations WHERE rt_num=? AND rt_stop_pos=?)", 
                  [$routeNumber, $stopNumber, $routeNumber, $nextStopNumber, $routeNumber, $prevStopNumber]);
    
    $db->execute();

    // Store the current/next/previous station names into our array
    while ( $row = $db->fetchRow() ) {
        array_push($nowNextStop, $row['st_name']);      
    }   // end while
} // end if
    
    // Reference:  URL's for departures and arrivals from BART API
    // http://api.bart.gov/api/sched.aspx?cmd=depart&orig=SFIA&dest=MLBR&date=now&time=now&key=MW9S-E7SL-26DU-VV8V&b=2&a=2&l=1
    // http://api.bart.gov/api/sched.aspx?cmd=arrive&orig=ASHB&dest=CIVC&date=now&time=now&key=MW9S-E7SL-26DU-VV8V&b=2&a=2&l=1
    
    // if we're on Stop 0, set up only the departure variables
    if (is_null($prevStopNumber)) {     
        $arriveUrl = NULL;
        $arriveDom = NULL;
        $arriveTree = NULL;

        $departUrl = 'http://api.bart.gov/api/sched.aspx?cmd=depart&orig='.$nowNextStop[0].'&dest='.$nowNextStop[1].'&date=now&time=now&key=MW9S-E7SL-26DU-VV8V&b=0&a=4&l=1';

        // verify url, if it can't be reached, set a flag
        if ( verify_url($departUrl) ) {
            $departDom = simplexml_load_file($departUrl);
            $departTree = $departDom->xpath("schedule");    
            $departNoShow = false;
        }
        else {
            $departNoShow = true;
        }        
    }
    // if we're on last stop, setup only the arrival variables
    else if (is_null($nextStopNumber)) {    
        $arriveUrl = 'http://api.bart.gov/api/sched.aspx?cmd=arrive&orig='.$nowNextStop[1].'&dest='.$nowNextStop[0].'&date=now&time=now&key=MW9S-E7SL-26DU-VV8V&b=0&a=4&l=1';

        // verify url, if it can't be reached, set a flag
        if ( verify_url($arriveUrl) ) {
            $arriveDom = simplexml_load_file($arriveUrl);       
            $arriveTree = $arriveDom->xpath("schedule");  
            $arriveNoShow = false;
        }
        else {
            $arriveNoShow = true;
        }   

        $departUrl = NULL;
        $departDom = NULL;
        $departTree = NULL;
    }
    // else setup both departure & arrival variables
    else {  
        $departUrl = 'http://api.bart.gov/api/sched.aspx?cmd=depart&orig='.$nowNextStop[0].'&dest='.$nowNextStop[1].'&date=now&time=now&key=MW9S-E7SL-26DU-VV8V&b=0&a=4&l=1';
        $arriveUrl = 'http://api.bart.gov/api/sched.aspx?cmd=arrive&orig='.$nowNextStop[2].'&dest='.$nowNextStop[0].'&date=now&time=now&key=MW9S-E7SL-26DU-VV8V&b=0&a=4&l=1';

        // verify url, if it can't be reached, set a flag
        if ( verify_url($departUrl) ) {
            $departDom = simplexml_load_file($departUrl);
            $departTree = $departDom->xpath("schedule"); 
            $departNoShow = false;
        }
        else {
            $departNoShow = true;
        } 

        // verify url, if it can't be reached, set a flag
        if ( verify_url($arriveUrl) ) {
            $arriveDom = simplexml_load_file($arriveUrl);       
            $arriveTree = $arriveDom->xpath("schedule");  
            $arriveNoShow = false;
        }
        else {
            $arriveNoShow = true;
        }   
    }
?>

<section class='arrivals'>              <!-- container to display data for next several arrivals -->

<?php  
    if (is_null($prevStopNumber)) {     // if we're on stop 0, don't create any HTML to display 
        // do nothing; 
    }
    else if ($arriveNoShow)  {          // else if url can't be reached, display error message
        echo "<div class = 'trip-details'>"; 
        echo "<header class='cf'>"; 
        echo "<p>Error: Can't reach Bart API</p>";
        echo "</header>";
        echo "</div>"; 
    }
    else {                              // else, parse the DOM and return to Javascript the HTML for arrival data 
?> 
    <h2>Arrivals</h2> 
<?php 
        foreach($arriveTree[0]->request->trip as $index=>$value)  { 
            echo "<div class = 'trip-details'>"; 
            echo "<header class='cf'>"; 
            echo "<p>".$value->attributes()['origin']." to ". $value->attributes()['destination'] . "</p>"; 
            echo "<p>DEPART: ".$value->attributes()['origTimeMin']."</p>"; 
            echo "<p>ARRIVE: ". $value->attributes()['destTimeMin']."</p>"; 
            echo "<p>Fare: $".$value->attributes()['fare']."</p>"; 
            echo "</header>"; 
            /* 
            foreach($value->leg as $value2) { 
                echo "<div class='leg-details'>";            
                echo "<p>Leg #: ". $value2->attributes()['order']."</p>"; 
                echo "<p>". $value2->attributes()['line']." TRAIN ". $value2->attributes()['trainIdx']  ."</p>"; 
                echo "<p>Leave ". $value2->attributes()['origin']. " @ ".$value2->attributes()['origTimeMin']."</p>"; 
                echo "<p>Arrive ". $value2->attributes()['destination']. " @ ".$value2->attributes()['destTimeMin']."</p>"; 
                echo "</div>"; 
            } 
            */  
            echo "</div>"; 
        } 
    }     
?> 
</section>

<section class='departures'>        <!-- container to display data for next several departures -->

<?php
    if (is_null($nextStopNumber)) { // if we're on last stop, don't create any HTML to display
        // do nothing;
    }
    else if ($departNoShow)  {      // else if url can't be reached, display error message
        echo "<div class = 'trip-details'>"; 
        echo "<header class='cf'>"; 
        echo "<p>Error: Can't reach Bart API</p>";
        echo "</header>";
        echo "</div>"; 
    }
    else {                          // else, parse the DOM and return to Javascript the HTML for departure data
?>
    <h2>Departing</h2>
<?php
        foreach($departTree[0]->request->trip as $index=>$value)  {
            echo "<div class = 'trip-details'>";
            echo "<header class='cf'>";
            echo "<p>".$value->attributes()['origin']." to ". $value->attributes()['destination'] . "</p>";
            echo "<p>DEPART: ".$value->attributes()['origTimeMin']."</p>";
            echo "<p>ARRIVE: ".$value->attributes()['destTimeMin']."</p>";
            echo "<p>Fare: $".$value->attributes()['fare']."</p>";
            echo "</header>";
            /*
            foreach($value->leg as $value2) {
                echo "<div class='leg-details'>";           
                echo "<p>Leg #: ". $value2->attributes()['order']."</p>";
                echo "<p>". $value2->attributes()['line']." TRAIN ". $value2->attributes()['trainIdx']  ."</p>";
                echo "<p>Leave ". $value2->attributes()['origin']. " @ ".$value2->attributes()['origTimeMin']."</p>";
                echo "<p>Arrive ". $value2->attributes()['destination']. " @ ".$value2->attributes()['destTimeMin']."</p>";
                echo "</div>";
            }
            */
            echo "</div>";
        }
    }   
?>
</section>
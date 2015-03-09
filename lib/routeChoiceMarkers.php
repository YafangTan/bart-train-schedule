<?php
/**************************************************************************************************
routeChoiceMarkers.php
    User chooses route from drop down menu -> submits AJAX POST request to this file.
    This file will take the route # selected, query the "locations" table, and 
    return a JSON data object with latitude / longitude coordinates of each train stop in the route.
    Javascript will draw Google Map Markers from the coordinate data.
***************************************************************************************************/

    include('database_class.php');                                                          
    $db = new Database;         
    $dummyArr = [];                     // $dummyArr will contain objects.  Each object represents each stations coordinates.

    // The class below is used to instantiate an object for each train stop.
    class TrainStop                     
    {
        public $currentStopNumber;          // the current stop #
        public $currentStationName;         // the current stop's abbr name
        public $currentFullName;            // the current stop's full name
        public $latitude;                   // the current stop's latitude
        public $longitude;                  // the current stop's longitude
        public $nextStationName;            // the abbr name of the next stop
        public $prevStationName;            // the abbr name of the previous stop
        public $departures = [];            // array to hold times of next departures
        public $arrivals = [];              // array to hold times of next arrivals
            
        public function __construct($a, $b, $c, $d, $e) {   // constructor to instantiate the first 5 properties.
            $this->currentStopNumber  = $a;                 // next / prev station names will be set later in the PHP code
            $this->currentStationName = $b;                 // the departure/arrival arrays are set in Javascript when it handles this ajax response
            $this->currentFullName    = $c;
            $this->latitude  = $d;
            $this->longitude = $e;
        }
    }

    if (isset($_POST)) {                                    // verify AJAX sent a POST request
        $routeChoice = $_POST['choice'];                    // store the user's chosen route

        // Ask SQL for the # of stops of the given route.  
        // Then decrement to get the last stop #.
        $db->prepare("SELECT rt_num_station FROM routeinfo WHERE rt_num=?", [$routeChoice]);
        $db->execute();

        while ($fetch = $db->fetchRow() ) {
            $lastStop = $fetch['rt_num_station'];
        }

        $lastStop--;

        // Ask SQL for data on each stop in the given route.
        // stop abbr name, stop #, latitude, longitude, stop full name.
        $db->prepare("
            SELECT 
                stations.st_name, stations.rt_stop_pos, locations.latitude, locations.longitude, locations.fullname
            FROM 
                stations INNER JOIN locations on stations.st_name = locations.st_name 
            WHERE rt_num = ?", [$routeChoice]);

        $db->execute();

        while ( $result = $db->fetchRow() ) {
            $obj = new trainStop(  (int) $result['rt_stop_pos'],        // current stop's number
                                   $result['st_name'],                  // current stop's abbr name
                                   $result['fullname'],                 // current stop's full name
                                   (float) $result['latitude'],         // current stop's latitude
                                   (float) $result['longitude']         // current stop's longitude
                                );
                    
            array_push($dummyArr, $obj);                                // push each stop's object into the dummy array
        } // end while

        
        // iterate through the dummy array, and for each stop, set the names for the next & previous stations
        // this'll be used in Javascript to query the BART API for real-time departure times to display
        // in the Google Map Markers
        for ($i = 0; $i < sizeof($dummyArr); $i++) {
            
            // Set "next station" for all stops except the last one.
            if ( $dummyArr[$i]->currentStopNumber !== $lastStop) {
                $dummyArr[$i]->nextStationName = $dummyArr[$i+1]->currentStationName;
            }

            // Set "previous station" for all stops except the first one.
            if ( $dummyArr[$i]->currentStopNumber !== 0) {
                $dummyArr[$i]->prevStationName = $dummyArr[$i-1]->currentStationName;
            }
        }

        // send JSON data back to Javascript                
        echo json_encode($dummyArr);
    }
?>

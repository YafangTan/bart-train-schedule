<?php
/**************************************************************************************************
fillDetails.php
    This code gets route information from BART API and inserts into 2 SQL tables...
    1) the 'routeinfo' table ==> for each route, the # of stops does it has.
    2) the 'stations' table  ==> each route's individual stops & their stop numbers.
***************************************************************************************************/
// http://api.bart.gov/api/route.aspx?cmd=routeinfo&route=11&key=MW9S-E7SL-26DU-VV8V    // url for routeinfo table.

$routeNum = [1, 12, 6, 11, 5, 3, 8, 4, 7, 2, 19, 20];                                   // array to store id numbers of all 12 routes

$db->deleteTable("routeinfo");                                                          // clear out both SQL tables before inserting any info
$db->execute(); 

$db->deleteTable("stations");                                                           
$db->execute(); 

foreach ($routeNum as $value) {
    // next few lines create a DOM tree from the BART URL that we can navigate through
    $url = 'http://api.bart.gov/api/route.aspx?cmd=routeinfo&route=' . $value . '&key=MW9S-E7SL-26DU-VV8V';     
    $dom = simplexml_load_file($url);
    $stopsTree = $dom->xpath("routes/route");
    
    // "$val" represents each 'route' node in the tree
    foreach ( $stopsTree as $val) {                                                     
        
        // this sql query inserts (Route #) & (# of stops) into 'routeinfo' table
        $db->prepare("INSERT INTO routeinfo(rt_num, rt_num_station) VALUES(?, ?)", 
            [$val->number, $val->num_stns]);            
        $db->execute(); 

        // $stationArr will be an array filled with properties of the 'config' node
        $stationArr = get_object_vars($val->config);                                    

        // next iterate through $stationArr
        foreach($stationArr['station'] as $ind => $val_2) {                             
            // this sql query inserts (station abbreviation) & (route #) & (the stop #) into 'stations' table
            $db->prepare("INSERT INTO stations(st_name, rt_num, rt_stop_pos) VALUES(?, ?, ?)", 
                [$val_2, $val->number, $ind]);
            $db->execute(); 
        } 
    }
    
}

/**************************************************************************************************
    Below is fixer code for routes 11 & 12.  
    The BART API sends back wrong # of stations on both.
    Sends back 17, should be 18.  
    http://api.bart.gov/api/route.aspx?cmd=routeinfo&route=11&key=MW9S-E7SL-26DU-VV8V
    http://api.bart.gov/api/route.aspx?cmd=routeinfo&route=12&key=MW9S-E7SL-26DU-VV8V
***************************************************************************************************/

$db->prepare("UPDATE routeinfo SET rt_num_station=? WHERE rt_num=?", [18, 11]); // route 11 has 18
$db->execute();

$db->prepare("UPDATE routeinfo SET rt_num_station=? WHERE rt_num=?", [18, 12]); // route 12 has 18
$db->execute();

?>
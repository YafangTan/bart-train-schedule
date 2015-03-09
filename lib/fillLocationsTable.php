<?php
/**************************************************************************************************
fillLocationsTable.php
    This code asks BART API for latitude / longitude information for each train station (45 total)
    and inserts into the 'locations' SQL table.
***************************************************************************************************/
    $url = 'http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V';     
    $dom = simplexml_load_file($url);                                               
    $tree = $dom->xpath("stations/station");                                        

    $db->deleteTable("locations");
    $db->execute();

    foreach ($tree as $value) { 
        $db->prepare("INSERT INTO locations(st_name, latitude, longitude, fullname) VALUES(?, ?, ?, ?)", 
                        [$value->abbr, $value->gtfs_latitude, $value->gtfs_longitude, $value-> name]);
        $db->execute();         
    }   
?>
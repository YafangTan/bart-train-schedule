<?php
/**************************************************************************************************
fillRouteTable.php
    This code gets generic route information from the BART API and 
    inserts into the 'route' SQL table.
    Info includes: 
        1) Full route name 
        2) Abbreviated route name
        3) Route id number
        4) Hex color code
***************************************************************************************************/
    $url = 'http://api.bart.gov/api/route.aspx?cmd=routes&key=MW9S-E7SL-26DU-VV8V';     // BART API url
    $dom = simplexml_load_file($url);                                                   // create DOM from BART API
    $tree = $dom->xpath("routes/route");                                                // create more specific DOM tree to navigate

    $db->deleteTable("route");
    $db->execute();     
        
    // each "$value" is a sub-array w/ info for each unique route
    foreach ($tree as $value) {                                                         
        $db->prepare("INSERT INTO route(rt_name, rt_abbr, rt_num, rt_color) VALUES(?, ?, ?, ?)", 
                [$value->name, $value->abbr, $value->number, $value->color]);
        $db->execute();                 
    }       
?>
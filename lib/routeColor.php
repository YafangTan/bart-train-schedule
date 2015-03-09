<?php
/**************************************************************************************************
routeColor.php
    When user makes a route selection from the drop down menu, that submits a AJAX POST request
    to this file.  This file will take the route # selected, query the "route" table, and 
    return a JSON data object with the hex color code to show for the route on Google Maps.
***************************************************************************************************/

include('database_class.php');                                                          
$db = new Database;     

if (isset($_POST['choice'])) {
    $routeChoice = $_POST['choice'];

    $db->prepare("SELECT rt_color FROM route WHERE rt_num = ?", [$routeChoice]);
    $db->execute();

    while ( $result = $db->fetchRow() ) {
        $color = $result['rt_color'];
    }
    
    echo $color;
}
?>

<?php
/**************************************************************************************************
routeChoice.php
    User chooses route from drop down menu -> fires AJAX POST request to this file.
    This file takes the route # selected, queries "stations" SQL table & returns 
    the HTML code to make all the radio buttons for each route stop.
    Javascript will insert this HTML code into the <section> tag that has class "select-route-stops"
***************************************************************************************************/

include('database_class.php');                                                          
$db = new Database;     

if (isset($_POST)) {                                // check if AJAX POST request received
    $routeChoice = $_POST['choice'];                // store the route # selected by user
    
    // For each stop on this route, get the stop #, stop abbreviated name & stop full name from SQL table
    $db->prepare("SELECT                                
                    stations.rt_stop_pos AS stopNum,
                    stations.st_name AS abbrName,
                    locations.fullname as fullName
                  FROM 
                    stations INNER JOIN locations ON stations.st_name = locations.st_name
                  WHERE stations.rt_num=?", [$routeChoice]);
    
    $db->execute();
?>
    
<?php
    // The SQL result set contains all stops for the given route #.  
    // Below will loop through the set and return the HTML code of radio inputs for each Stop.

    while ( $row = $db->fetchRow() ) {
?>
    <div>
        <input type="radio" name="routes" id=<?php echo $row['abbrName']; ?>  value= <?php echo $row['stopNum']; ?>>
        <label for=<?php echo $row['abbrName']; ?>><?php echo '['.$row['stopNum'].']'./*' '.$row['abbrName'].*/' '.$row['fullName']; ?></label>
    </div>
<?php
    }   // end while    
?>
    
<?php
} // end if

?>

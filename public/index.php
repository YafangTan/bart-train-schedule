<?php
/**************************************************************************************************
index.php
    This is the home page.
***************************************************************************************************/
    require_once('../lib/config.php');                  // config.php defines constant variables to use (eg: ROOT).                 
    require_once(ROOT.'/lib/database_class.php');       // database class has all the methods for getting information from SQL tables.
    $db = new Database;                                 // instantiate a database object
    //include(ROOT.'/lib/fillRouteTable.php');          // un-comment only if "route" SQL table is empty.
    //include(ROOT.'/lib/fillDetails.php');             // un-comment only if "routeinfo" & "stations" tables are empty.
    //include(ROOT.'/lib/fillLocationsTable.php');      // un-comment only if "locations" table is empty.
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CS75 Project 2 - Bart Train Schedule</title>
        <link href="../css/normalize.css" rel="stylesheet" type="text/css">
        <link href="../css/style.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js">
    </script>
    </head>
    <body>      
        <header>
            <h1>CS75 Project 2 - Bart Train Schedule</h1>
        </header>

        <section class = 'inst'>
            <p>1) Select a route from the drop down menu below</p>
            <p>2) Select a train station with the radio buttons.</p>
            <p>3) Detailed arrival / departure information will appear</p>
            <p>4) The route will be shown in the Google map.  <br/>You can click on a station's marker for departure times.</p>
        </section>

        <section class = 'user-area cf'>                                        <!-- large container for drop down menu & detailed route info -->
            <form class='select-route'>
                <h2>Choose a Route & Stop:</h2>
                <select>                                                        <!-- the drop down menu to select a specific route -->
                <?php                                                           // PHP code to query SQL and populate the <option> tags
                    $db->prepare("SELECT                                        
                                    route.rt_name AS 'ROUTE_NAME', 
                                    route.rt_num AS 'ROUTE_NUM',
                                    routeinfo.rt_num_station AS 'STOPS'
                                  FROM 
                                    route 
                                  INNER JOIN 
                                    routeinfo 
                                  ON 
                                    route.rt_num = routeinfo.rt_num
                                  ORDER BY 
                                    route.rt_num");
                    $db->execute();

                    while ( $row = $db->fetchRow() ) {                          // Menu will have 12 choices for the 12 BART routes
                ?>
                    <option value = <?php echo '\''. $row['ROUTE_NUM'] . '\''; ?>><?php echo 'R'.$row['ROUTE_NUM'].' '.$row['ROUTE_NAME']; ?></option>
                <?php
                    } // end while loop
                ?>
                </select>

                <section class='select-route-stops'>                            <!-- container for 12 radio buttons for 12 routes -->
                </section>
            </form>

            <section class='information-panel'>                                 <!-- container for detailed route information -->
            </section>
            <div id="map"></div>                                                    <!-- a div container for the google map -->
        </section>  

        

        <script src="../js/script.js" type="text/javascript"></script>
    </body>
</html>
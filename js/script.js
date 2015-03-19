/**************************************************************************************************
script.js -- All code is in Vanilla Javascript
***************************************************************************************************/

var selectRouteStopsForm = document.querySelector('.select-route-stops');       // The container for the radio buttons of a route's stations
var routeSelectMenu = document.querySelector('select');                         // The drop down menu of the 12 BART routes
var routeRadioBtns = document.getElementsByName("routes");                      // node list of each radio input button
var req = new XMLHttpRequest();                                                 // ajax object
var userSelect = {};                                                            // a object to hold properties related to user's route choice                       
var infoPanel = document.querySelector('.information-panel');                   // The container displaying arrival/departure times

function makeAjax(callback, url, postData, method, responseType) {              // Generic function to make AJAX requests
    req.onreadystatechange = function() {                                       // Arguments: 1) a callback function to handle response 
        if (req.readyState === 4 && req.status === 200) {                       //            2) url to query
            if (responseType === 'responseText')                                //            3) data to send in POST request
                callback(req.responseText);                                     //            4) method to use (POST OR GET)
            }                                                                   //            5) response type to handle (Text OR XML)
            else if (responseType === 'responseXML' ) {
                callback(req.responseXML);
            }
        }   

    req.open (method, url, true);                                               // true is asynchronous
    req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

    if (postData === null) {            // if no data for POST, means we send GET w/out any data
        req.send();
    }
    else {
        req.send(postData);             // if we have data, send POST with the data
    }   
}

// This function is called to handle an AJAX response. It displays the radio buttons for route stops.
function populateStopsList(response) {
    // Insert AJAX response (HTML code for radio buttons) into the container.
    selectRouteStopsForm.innerHTML = response;

    // Each radio button needs a click event handler.  When user clicks on radio button,
    // make another AJAX request for HTML code that displays that stop's real-time
    // arrival / departure times.
    for (var i = 0; i < routeRadioBtns.length; i++) {
        routeRadioBtns[i].addEventListener('click', (function (i) {
            return function() {                 
                userSelect.routeNumber     = parseInt(routeSelectMenu.value);
                userSelect.stopNumber      = parseInt(routeRadioBtns[i].value);
                userSelect.prevStopNumber  = parseInt(routeRadioBtns[i].value) - 1;
                userSelect.nextStopNumber  = parseInt(routeRadioBtns[i].value) + 1; 
                makeAjax(showTripDetails, '../lib/routeTimes.php', 
                    'rtNum=' + userSelect.routeNumber + '&stopNum='+userSelect.stopNumber + 
                    '&prevStop=' + userSelect.prevStopNumber + '&nextStop='+userSelect.nextStopNumber, 
                    'POST', 'responseText');
            }       
        } ) (i) )
    }
}

// This function is called to handle an AJAX response. 
// It displays the HTML for real-time arrival/departures times of a route stop.
function showTripDetails (response) {
    infoPanel.innerHTML = response;
}

// This function is called to handle an AJAX response. 
// It stores the hex color code for user selected route.
function getRouteColor (response) {
    routeColor = response;
}

// On window load, do these things...
window.addEventListener('load', function() {

    // populate the radio buttons for  route 1
    makeAjax(populateStopsList, '../lib/routeChoice.php'       , 'choice=1', 'POST', 'responseText');           

    // display the Google Map Markers for route 1
    setTimeout ( function() {
        makeAjax(getMarkerData    , '../lib/routeChoiceMarkers.php', 'choice=1', 'POST', 'responseText');
    }, 500);

    // when user selects a different stop on which ever route that is currently being shown
    routeSelectMenu.addEventListener("change", function () {
        // clear out the container that displays arrival / departure times
        infoPanel.innerHTML = '';

        // populate the radio buttons for the route
        makeAjax(populateStopsList, '../lib/routeChoice.php'    , 'choice=' + routeSelectMenu.value, 'POST', 'responseText');           

        // populate Google Map Markers
        setTimeout ( function() {
            makeAjax(getMarkerData, '../lib/routeChoiceMarkers.php', 'choice=' + routeSelectMenu.value, 'POST', 'responseText');        
        }, 500);    

        // get the hex color code for the route
        setTimeout ( function() {
            makeAjax(getRouteColor, '../lib/routeColor.php', 'choice=' + routeSelectMenu.value, 'POST', 'responseText');
        }, 1000);
    })

})

/***********************
    GOOGLE MAPS CODE 
************************/
var SF = { lat: 37.7577   , lon: -122.4376};            // San Francisco will be center on map, store it's coordinates
var routeColor;                                         // store hex code of selected route color

// "getMarkerData" handles the AJAX response where we get coordinate data of each stop on a route.
// it then calls displayMap() to draw the markers on the google map.
function getMarkerData (response) {
    var stopMarkers = JSON.parse(response);

    // if google maps api can't be reached, display error message in map
    if ( typeof google === 'undefined') {
        document.querySelector('#map').innerHTML = '';
        var newP = document.createElement('p');
        newP.textContent = "Error: Can't reach Google API";
        document.querySelector('#map').appendChild(newP);
    }
    else {      // else show the google map
        displayMap({
                    center: { lat: SF.lat, lng: SF.lon },
                    zoom: 10,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }, stopMarkers);    
    }    
}

// An ajax request will call "getMarkerData", which in turns calls "displayMap" to draw the Google Map.
// Arguments: 1) props is an object with map properties (eg: center & show road map)
//            2) stopMarkers is a JSON array of objects.  Each object holds data for each station's Google marker.
function displayMap(props, stopMarkers) {
    var drawMap = new google.maps.Map(document.querySelector('#map'), props);       // the google map
    var polylinePath = [];                              // array of objects with each station's coordinates for the polyline
    var marker, i;                                      // global marker and i variables for the Google Maps closure issue
    var infowindow = new google.maps.InfoWindow();      // global info window for the Google Maps closure issue
    var arriveArr = [];                                 // array to hold arrival times of each station
    var departArr = [];                                 // array to hold departure times of each station

    //if (stopMarkers) {                                    // we'll have stop markers whenever user chooses a new route
        
        // iterate through each object and insert data for each station's marker
        for (i = 0; i < stopMarkers.length; i++) {
            
            // create a new marker object at each station
            marker = new google.maps.Marker({
                // set the latitude / longitude of marker
                position: { lat: stopMarkers[i].latitude, lng: stopMarkers[i].longitude },
                
                // draw marker on "drawMap"
                map : drawMap,

                // title is shown when mouse is hovering over a marker
                title : '[' + stopMarkers[i].currentStopNumber + '] ' + stopMarkers[i].currentFullName
            })  


            // store each station's coordinates into the polyline array
            polylinePath.push( new google.maps.LatLng( stopMarkers[i].latitude, stopMarkers[i].longitude ) );        
            
            // this immediately invoked function will query the BART API for departures times of each station,
            // then store the times into the departures array of each station object.
            // departure times are close to arrival times, so only departures are queried for.
            (function getTimes(i, req2) {
                req2.open("GET", 'http://api.bart.gov/api/sched.aspx?cmd=depart&orig=' + stopMarkers[i].currentStationName + 
                               '&dest=' + stopMarkers[i].nextStationName + '&date=now&key=MW9S-E7SL-26DU-VV8V&b=0&a=4&l=1', true);
                req2.onreadystatechange = function() {
                    if (req2.readyState === 4 && req2.status === 200) {
                        if ( i !== (stopMarkers.length-1) ){
                            var parser = new DOMParser();
                            var doc = parser.parseFromString(req2.responseText, "text/xml");
                            var departTrips = doc.getElementsByTagName('root')[0].childNodes[4].childNodes[4].getElementsByTagName('trip');
                            
                            for (var j=0; j<departTrips.length; j++) {
                                if (navigator.userAgent.indexOf("Trident") === -1) { // latest IE uses Trident
                                    stopMarkers[i].departures.push(departTrips[j].attributes[3].value) // Not IE, index is 3
                                }
                                else {
                                    stopMarkers[i].departures.push(departTrips[j].attributes[4].value) // IE, index is 4
                                }                                
                            }
                        }                       
                    }
                }
                req2.send();    
            }) (i, new XMLHttpRequest() );          

            
            // a click event handler for when user click's on a google marker.
            // it will show a pop-up window with the station's departure times.
            // departure times are close to arrival times, so only departures are shown.
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function () {
                    if (i != (stopMarkers.length-1) ) {
                        infowindow.setContent(
                            '<p>[' + stopMarkers[i].currentStopNumber + '] ' + stopMarkers[i].currentFullName + '</p>'  + 
                            /*
                            '<p>Arrivals: ' + stopMarkers[i].arrivals[0][Object.keys(stopMarkers[i].arrivals[0])[0]] + ' - ' + 
                                              stopMarkers[i].arrivals[1][Object.keys(stopMarkers[i].arrivals[1])[0]] + ' - ' + 
                                              stopMarkers[i].arrivals[2][Object.keys(stopMarkers[i].arrivals[2])[0]] + ' - ' + 
                                              stopMarkers[i].arrivals[3][Object.keys(stopMarkers[i].arrivals[3])[0]] + '</p>' + 
                            */
                            '<p>Departures: ' + stopMarkers[i].departures[0] + ' - ' + 
                                                stopMarkers[i].departures[1] + ' - ' + 
                                                stopMarkers[i].departures[2] + ' - ' + 
                                                stopMarkers[i].departures[3] + '</p>'
                        ); 
                        infowindow.open(drawMap, marker);
                    }
                    else {
                        infowindow.setContent(
                            '<p>[' + stopMarkers[i].currentStopNumber + '] ' + stopMarkers[i].currentFullName + '</p>'  + 
                            '<p>Last Stop, No Departures</p>'
                        ); 
                        infowindow.open(drawMap, marker);
                    }
                }               
            } ) (marker, i) );

        }

        // a poly line object
        var polyline = new google.maps.Polyline({
            path: polylinePath,
            geodesic: true,
            strokeColor: routeColor,
            strokeOpacity: 1.0,
            strokeWeight: 2
        });

        // draw the poly line
        polyline.setMap(drawMap);       
    //}
}

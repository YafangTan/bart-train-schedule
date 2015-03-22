********************
Bart Train Schedule
********************
The idea for this project comes from: 
	Project 2 from Harvard CS75
	http://cdn.cs75.net/2012/summer/projects/2/

Project Details:
	Create a website where users can look up real-time schedule 
	information (arrivals / departures) of BART train routes.

Hosted Link:
	http://176.32.230.7/pliubart.com/

Instructions:
	Users pick a route from the drop down menu, a list of stations will show.
	Users pick a station, the real-time arrivals/departures appear on the page.
	Also, the route is drawn in a google map and users can click on the map
	marker of a station & see real-time departure times pop-up on the map.
	By default, route #1 is displayed in the Google map on first page load.
	The bart.sql file has all the tables pre-filled with data from the BART API.

Languages: 
	HTML - CSS - PHP - SQL - Javascript

3rd Party Tools: 
	- BART API 
	- Google Maps API

Helpful Resources (many thanks):
Needed lots of help with several issues...
1) Needed a closure for a click event handler on a google maps marker.
   Answer can be found here:
   http://stackoverflow.com/questions/3059044/google-maps-js-api-v3-simple-multiple-marker-example

2) How to get and parse an XML file in Javascript:
   http://stackoverflow.com/questions/8237923/parsing-xml-rss-from-url-using-java-script

3) How to do AJAX in a for-loop:
   http://stackoverflow.com/questions/13111612/call-ajax-inside-for-loop

Needed Improvements:
	- BART API calls are sometimes slow
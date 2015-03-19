<?php
/**************************************************************************************************
helpers.php
    a collection of helper functions
***************************************************************************************************/

	// this will verify if the Google Maps API can be connected to
	function verify_url($url) { 
	    $ch = curl_init($url);                          // initialize curl session  
		curl_setopt($ch, CURLOPT_NOBODY, true);         // exclude body 
		curl_exec($ch);                                 // execute curl session 
		$code = curl_getinfo($ch, CURLINFO_HTTP_CODE);  // extract HTTP code 
		curl_close($ch);                                // close session 

		if ( $code === 200 ) {                          // if 200, then csv file exists. 
			return true; 
		} 
		return false; 
	}
?>

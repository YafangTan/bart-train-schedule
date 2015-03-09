<?php
/**************************************************************************************************
config.php
    This file contains constant variable definitions used by the other files.
    If constant is already defined, don't do anything.  Else, define it.
***************************************************************************************************/\

    DEFINED('DS')    ? null : define('DS'  , DIRECTORY_SEPARATOR);
    
    DEFINED('ROOT')  ? null : define('ROOT', DS.'xampp'.DS.'htdocs'.DS.'port'.DS.'bart');
    
    DEFINED('LIB')   ? null : define('LIB' , ROOT.DS.'lib');
    
    DEFINED('DB_SERVER') ? null : define('DB_SERVER', 'localhost');
    DEFINED('DB_USER')   ? null : define('DB_USER', 'pat');
    DEFINED('DB_PASS')   ? null : define('DB_PASS', 'liu');
    DEFINED('DB_NAME')   ? null : define('DB_NAME', 'bart');
    
    
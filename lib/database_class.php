<?php
/**************************************************************************************************
database_class.php
    This is the class for the database object, 
    it has methods to handle pulling data from the SQL database.
    PHP PDO is the method used to do the data pulls.
***************************************************************************************************/

require_once('config.php');

class Database {
    private $dbc;
    private $query_statement;
    
    public function __construct() {
        $this->connect();
    }   
    
    public function connect() {
        try {
            $this->dbc = new PDO("mysql:host=".DB_SERVER."; dbname=".DB_NAME, DB_USER, DB_PASS);
            $this->dbc->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } 
        catch(PDOException $e) {
            $this->error = $e->getMessage();
            echo "Sorry dude, Databse Connection Error: ".$this->error;
        }
    }
        
    public function prepare($q, $arr=[]) {                      // "INSERT INTO cars(make, model, year)"...array is ["honda", "accord", "1997"]
        $this->query_statement = $this->dbc->prepare($q);
        
        //echo "This is Q: ".$q."<br>";
        //echo "<pre>";
        //print_r($arr);
        //echo "</pre>";
        
        foreach($arr as $index => &$value) {                                    // you need an indexed array for this to work
            $this->query_statement->bindParam( ($index+1), $value);
        }
    }

    public function deleteTable ($tableName) {
        $this->query_statement = $this->dbc->prepare("DELETE FROM ".$tableName);
    }
    
    public function execute() {
        $this->query_statement->execute();
    }
    
    public function fetchRow() {    
        return $this->query_statement->fetch(PDO::FETCH_ASSOC);
    }   
    
    public function fetchAll() {    
        return $this->query_statement->fetchAll();
    }   
    
    public function rowCount() {
        return $this->query_statement->rowCount();
    }   
}

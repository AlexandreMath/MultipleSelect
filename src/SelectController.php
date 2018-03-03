<?php

require 'Database.inc.php';

class SelectController
{
    public $database;

    public $result;

    public function __construct()
    {
        $this->database = New Database();
    }

    public function getFirstSelect()
    {   
        try {
            $this->result = $this->database->selectApartenance();
            return $this->result;
        }
        catch(Exception $ex){
            throw new Exception("ERREUR");
        }
        
    }
    public function getSelect($table, $filter)
    {   
        try {
            $this->result = $this->database->selectPecific($table, $filter);
            return $this->result;
        }
        catch(Exception $ex){
            throw new Exception("ERREUR");
        }
        
    }
}
?>
<?php
class Database
{
    public $connection;

    public function __construct(){
        $this->connection = new PDO('mysql:host=localhost; dbname=starwars', 'root','root');
    
        // En cas d'erreur de connection, on coupe tout et on affiche un message d'erreur
            if (!$this->connection) {
                die("impossible d'ouvrir la base de données");
            }
    }

    public function selectApartenance()
    {
        $select="SELECT * FROM appartenance";
        $execut = $this->connection->prepare($select);
        $execut->execute();
        $resultat = $execut->fetchAll(PDO::FETCH_OBJ);
    
        return $resultat;
    }
    
    public function selectPecific($table, $filter)
    {
        $execut = $this->connection->prepare("SELECT id, name FROM $table WHERE foreign_id = ?");
        $execut->execute([$filter]);
        $resultat = $execut->fetchAll();
    
        return $resultat;
    }
}
?>
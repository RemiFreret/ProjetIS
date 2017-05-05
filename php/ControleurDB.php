<?php
  include_once("ConnectionDB.php");

  class ControleurDB {

    public function __construct() {

    }

    public function getTest () {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT * FROM Robot";

      $requete = $bdd->prepare($query);
      $requete->execute();
      echo json_encode($requete->fetchAll());
    }

  }
 ?>

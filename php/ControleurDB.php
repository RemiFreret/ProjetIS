<?php
  include_once("ConnectionDB.php");

  class ControleurDB {

    public function __construct() {

    }

    // Return all informations about the robot with the given id
    public function updateRobot ($robotID) {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT R.nomRobot, P.nomPosition, E.couleur FROM Robot as R, Etat as E, Position as P WHERE R.etat = E.id AND R.position = P.id AND R.id = ".$robotID;

      $requete = $bdd->prepare($query);
      $requete->execute();
      echo json_encode($requete->fetchAll());
    }

    // Return how many robots there are
    public function nbRobot () {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT COUNT(id) as nbRobot FROM Robot";

      $requete = $bdd->prepare($query);
      $requete->execute();
      echo json_encode($requete->fetchAll());
    }

  }
 ?>

<?php
  include_once("ConnectionDB.php");

  class ControleurDB {

    public function __construct() {

    }

    public function initRobot () {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT R.nomRobot, P.nomPosition, E.couleur FROM Robot as R, Etat as E, Position as P WHERE R.etat = E.id AND R.position = P.id";

      $requete = $bdd->prepare($query);
      $requete->execute();
      echo json_encode($requete->fetchAll());
    }

  }
 ?>

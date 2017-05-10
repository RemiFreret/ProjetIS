<?php
  include_once("ControleurDB.php");

  if ( isset($_GET["requete"]) ) {
    if (strcmp($_GET["requete"], "updateRobot") == 0) {
      $bdd = ControleurDB::updateRobot($_GET["robot"]);
      echo $bdd;
    }
    if (strcmp($_GET["requete"], "nbRobot") == 0) {
      $bdd = ControleurDB::nbRobot();
      echo $bdd;
    }
  }

  if ( isset($_GET["file"]) ) {
    if (file_exists($_GET["file"]) == 1) {
      echo file_get_contents($_GET["file"]);
    }
  }
?>

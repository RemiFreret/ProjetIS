<?php
  include_once("ControleurDB.php");

  if ( isset($_GET["requete"]) ) {
    if (strcmp($_GET["requete"], "initRobot") == 0) {
      $bdd = ControleurDB::initRobot();
      echo $bdd;
    }
  }

  if ( isset($_GET["file"]) ) {
    if (file_exists($_GET["file"]) == 1) {
      echo file_get_contents($_GET["file"]);
    }
  }
?>

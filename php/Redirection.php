<?php
  include_once("ControleurDB.php");

  if ( isset($_GET["requete"]) ) {
    if (strcmp($_GET["requete"], "updateRobot") == 0) {
      $robotID = substr($_GET["robot"], -1, 1);
      $bdd = ControleurDB::updateRobot($robotID);
      echo $bdd;
    }
    if (strcmp($_GET["requete"], "nbRobot") == 0) {
      $bdd = ControleurDB::nbRobot();
      echo $bdd;
    }
    if (strcmp($_GET["requete"], "infoMine") == 0) {
      $bdd = ControleurDB::infoMine();
      echo $bdd;
    }
	if (strcmp($_GET["requete"], "infoRobot") == 0) {
		$robotID = substr($_GET["robot"], -1, 1);
		$bdd = ControleurDB::infoRobot($robotID);
      echo $bdd;
    }
  }

  if ( isset($_GET["file"]) ) {
    if (file_exists($_GET["file"]) == 1) {
      echo file_get_contents($_GET["file"]);
    }
  }
?>

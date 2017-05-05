<?php
  include_once("ControleurDB.php");

  if ( isset($_GET["test"]) ) {
    $bdd = ControleurDB::getTest();
    echo $bdd;
  }
?>

<?php

  class ConnectionDB {
    /*
    fonction permettant de se connecter à la base de donnee
    */
    public static function getConnection() {
      try {
        $bdd = new PDO('mysql:host=localhost;dbname=ProjetIS;charset=utf8', 'ProjetIS', 'projetis', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
      } catch(PDOException $e) {
        print ("Erreur ! : " . $e->getMessage() . "<br/>");
        die();
      }
      return $bdd;
    }

  }

 ?>

<?php
  include_once("ConnectionDB.php");

  class ControleurDB {

    public function __construct() {

    }

    // Return all informations about the robot with the given id
    public function updateRobot ($robotID) {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT R.nomRobot, P.nomPosition, E.couleur FROM Robot as R, Etat as E, Position as P WHERE R.etat = E.id AND R.position = P.id AND R.id = :robotID";

      $requete = $bdd->prepare($query);
      $requete->execute(array(':robotID' => $robotID));
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

    // Return how many robots there are
    public function infoMine () {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT * FROM Mine Where id = 0";

      $requete = $bdd->prepare($query);
      $requete->execute();
      echo json_encode($requete->fetchAll());
    }
	//return information about a robot
  	public function infoRobot ($robotID) {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT R.nomRobot, P.nomPosition, E.nomEtat, R.batterie, R.nomOpérateur FROM Robot as R, Etat as E, Position as P WHERE R.etat = E.id AND R.position = P.id AND R.id = :robotID";

      $requete = $bdd->prepare($query);
      $requete->execute(array(':robotID' => $robotID));
      echo json_encode($requete->fetchAll());
    }

    // Return the Alerte with Robot
    public function infoPlus () {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT A.type, A.date, A.description, R.nomRobot, P.nomPosition FROM Alerte A, Position P, Robot R WHERE A.idRobot = R.id AND A.position = P.id AND A.date < CURRENT_TIMESTAMP ORDER BY date DESC LIMIT 5";

      $requete = $bdd->prepare($query);
      $requete->execute();
      echo json_encode($requete->fetchAll());
    }

    // Return the Alerte with Robot
    public function majBDD ($cpt) {
      $bdd = ConnectionDB::getConnection();

      $query = "SELECT * FROM Mine";

      if ($cpt == 0) {
        $query = "UPDATE Mine SET dechetExtrait = 10686, dechetExtraitMois = 606, dechetExtraitSemaine = 54, mouleAjd = 2 WHERE Mine.id = 0";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 1, position = 20, batterie = 95 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 1, batterie = 53 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 14, batterie = 77 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 1) {
        $query = "UPDATE Robot SET etat = 1, position = 20, batterie = 97 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 1, batterie = 51 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 13, batterie = 75 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 2) {
        $query = "UPDATE Robot SET etat = 1, position = 20, batterie = 100 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 1, batterie = 49 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 73 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "INSERT INTO Alerte (id, type, date, description, position, idRobot) VALUES (6, 1, CURRENT_TIMESTAMP, 'Robot n°1 chargé à 100%', 20, 1);";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 3) {
        $query = "UPDATE Robot SET etat = 2, position = 20, batterie = 100 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 1, batterie = 47 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 71 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 4) {
        $query = "UPDATE Robot SET etat = 2, position = 18, batterie = 100 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 1, batterie = 45 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 69 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 5) {
        $query = "UPDATE Robot SET etat = 2, position = 19, batterie = 98 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 1, batterie = 41 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 67 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 6) {
        $query = "UPDATE Robot SET etat = 2, position = 17, batterie = 96 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 10, batterie = 39 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 65 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 7) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 92 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 10, batterie = 37 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 63 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "INSERT INTO Alerte (id, type, date, description, position, idRobot) VALUES (7, 1, CURRENT_TIMESTAMP, 'La route avant gauche du Robot n°2 à été endommagée', 10, 1);";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 8) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 92 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 18, batterie = 35 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 61 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 9) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 90 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 20, batterie = 33 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 59 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 10) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 88 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 20, batterie = 31 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 4, batterie = 57 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();

        $query = "UPDATE Mine SET dechetExtrait = 10689, dechetExtraitMois = 609, dechetExtraitSemaine = 57, mouleAjd = 3 WHERE Mine.id = 0";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 11) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 86 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 4, position = 20, batterie = 35 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 13, batterie = 55 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 12) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 84 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 4, position = 20, batterie = 38 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 14, batterie = 53 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 13) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 82 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 4, position = 20, batterie = 40 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 2, position = 14, batterie = 51 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      if ($cpt == 14) {
        $query = "UPDATE Robot SET etat = 2, position = 9, batterie = 82 WHERE Robot.id = 1;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 4, position = 20, batterie = 43 WHERE Robot.id = 2;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "UPDATE Robot SET etat = 3, position = 14, batterie = 50 WHERE Robot.id = 3;";
        $requete = $bdd->prepare($query);
        $requete->execute();
        $query = "INSERT INTO Alerte (id, type, date, description, position, idRobot) VALUES (8, 0, CURRENT_TIMESTAMP, 'Glissement de terrain dans le tunnel n°5 ! Robot n°3 hors service.', 14, 3);";
        $requete = $bdd->prepare($query);
        $requete->execute();
      }

      echo "OK";
    }
  }
 ?>

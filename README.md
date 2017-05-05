# ProjetIS

Organisation du dossier :

.
├── css
│   └── Mine.css
├── doc
│   ├── ProjetIS.sql
│   └── README.md
├── img
│   ├── Mine.svg
│   └── Schnitt-Schachtanlage_Asse.svg.png
├── index.html
├── js
│   └── controleur.js
└── php
    ├── ConnectionDB.php
    ├── ControleurDB.php
    └── Redirection.php

5 directories, 10 files

############### INSTRUCTIONS ###############

 - Première chose, quand vous travaillez, faite le sur votre branche comme je vous l'avais éxpliqué.
Pour les fusions de branche on verra plus tard ;)

 - Pour commencer, il faut installer correctement phpmyadmin :
Il suffit d'importer la BDD du fichier ProjetIS.sql et créer un utilisateur 'ProjetIS' avec comme mdp 'projetis'
Récap de l'état de la BDD pour que ça fonctionne :
Une BDD nommée 'ProjetIS', un utilisateur nommée 'ProjetIS' avec le mot de passe 'projetis'

 - Ensuite il faut laisser les fichiers ou ils sont car ils sont inter-dépendant !

 - La plupart du travail vas se faire de le fichier controleur.js.
Si vous voulez faire une fonction pour afficher quoi que ce soit, c'est la.
Il suffit d'écrire la fonction et l'appeler dans le onload.
Au besoin il faudra rajouter des div dans le fichier index.html pour pouvoir y placer des éléments (ex : la div 'map')

 - Pour accéder à la BDD :
On commence par faire une requête en AJAX dans le controleur.js (dans votre fonction) avec la data 'requete', exemple :

$.ajax({
  url: 'php/Redirection.php',
  data: "requete=initRobot",
  dataType: 'json',
  success: function(data) {
    console.log("Success");
    console.log(data);
  },
  error: function(data) {
    console.log("Error");
  }
});

La suite, créer la redirection dans le fichier 'Redirection.php' :

if (strcmp($######################GET["requete"], "initRobot") == 0) {
  $bdd = ControleurDB::initRobot();
  echo $bdd;
}

C'est la qu'on va choisir quelle action faire en fonction de la data 'requete'.
Il suffira d'appeler sa fonction : 'ControleurDB::##ICI##();'
Et donc, ernière étape, créer sa fonction dans le fichier ControleurDB.php, qui va contenir la requête a la BDD :

public function initRobot () {
  $bdd = ConnectionDB::getConnection();

  $query = "SELECT R.nomRobot, P.nomPosition, E.couleur FROM Robot as R, Etat as E, Position as P WHERE R.etat = E.id AND R.position = P.id";

  $requete = $bdd->prepare($query);
  $requete->execute();
  echo json_encode($requete->fetchAll());
}

Pour faire votre fonction, vous avez DEUX truc a changer : le nom de la fonction et la query !
Rien de plus facile :)

Si vous avez bien tout respecté, le résultat de la requête a la BDD devrait se retrouver dans le 'data' de la fonction 'success' de votre requête AJAX et c'est dans cette fonction que vous pourrez jouer avec les données.

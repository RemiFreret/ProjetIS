// Variables global du SVG de la map
var draw = SVG('map').size(800, 600);
var intervalAlerte;

// Code à executer au démarage
window.onload = function() {

  // Initialisation de la date et de l'heure
  initDate();

  // Initialisation du SVG de la map
  $.ajax({
    url: 'php/Redirection.php',
    data: "file=../img/Mine.svg",
    dataType: 'text',
    success: function(data) {
      var rawSvg = data;
      draw.svg(rawSvg);
      document.getElementById("fond").setAttribute("onclick", "resetInfo()");
    },
    error: function(data) {
      console.log("Error on init SVG");
    }
  });

  // Lancement de l'initialisation des robots
  $.ajax({
    url: 'php/Redirection.php',
    data: "requete=nbRobot",
    dataType: 'json',
    success: function(data) {
      initRobot(data[0].nbRobot);
    },
    error: function(data) {
      console.log("Error on nbRobot");
    }
  });

  // Liste des fonctions à appeler au démarage
  infoMine();
  infoPlus();

} // Fin onload

function resetInfo() {
  document.getElementById("infoPlusMain").style.display = "";
  document.getElementById("infoPlusRobot").style.display = "none";
}

// Initialisation des champs date et heure
function initDate() {
  setInterval( function () {
    var now = new Date();

    var monthNames = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Decembre"];
    var dayNames = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];

    var zeroD = "";
    var zeroH = "";
    var zeroM = "";
    if (now.getDate() < 10) zeroD = "0";
    if (now.getHours() < 10) zeroH = "0";
    if (now.getMinutes() < 10) zeroM = "0";

    var date = dayNames[now.getDay()] + ' ' + zeroD + now.getDate() + ' ' + monthNames[now.getMonth()] + ' ' + now.getFullYear();
    var heure = zeroH + now.getHours() + ' H ' + zeroM + now.getMinutes();

    document.getElementById('date').innerHTML = date;
    document.getElementById('heure').innerHTML = heure;

  }, 1000);
}// Fin initDate

// Initialisation des robots
function initRobot(nbRobot) {

  var robots = [nbRobot];

  for (var i = 0; i < nbRobot; i++) {
    robots[i] = draw.circle(14).id("Robot"+(i+1)).fill("#e3e3e3");
    updateRobot(robots[i]);
    document.getElementById("Robot" + (i+1)).setAttribute("onclick", "infoRobot(" + (i+1) + ")");
  }

} // Fin initRobot

function infoRobot(i) {
  document.getElementById("infoPlusMain").style.display = "none";
	$.ajax({
    url: 'php/Redirection.php',
    data: "requete=infoRobot&robot=" + i,
    dataType: 'json',
    success: function(data) {
    	document.getElementById("image_mine").setAttribute("src","/ProjetIS/img/Robot" + i + ".jpg");
  		document.getElementById('progress5').style.width =data[0].batterie + "%";
  		document.getElementById('spanProgress5').innerHTML = data[0].batterie + "%";
  		document.getElementById('operateur').innerHTML = '<info class="robotTitle">Opérateur :</info> ' + data[0].nomOpérateur;
  		document.getElementById('etat').innerHTML = '<info class="robotTitle">Etat :</info> ' + data[0].nomEtat;
      document.getElementById('position').innerHTML = '<info class="robotTitle">Position :</info> ' + data[0].nomPosition;
      document.getElementById("infoPlusRobot").style.display = "";
  	},
    error: function(data) {
      console.log("Error");
    }
  });
} // Fin infoRobot

// Mise à jour automatique des robots
function updateRobot(robot) {

  setInterval(function () {
    $.ajax({
      url: 'php/Redirection.php',
      data: "requete=updateRobot&robot=" + robot.id(),
      dataType: 'json',
      success: function(data) {
        var position = SVG.get(data[0].nomPosition).attr();
        var couleur = data[0].couleur;
        var x = position.x + (position.width/2);
        var y = position.y + (position.height/2);
        robot.cx(x).cy(y).fill(couleur);
        if (position.id.localeCompare("tunnel2") == 0) {
          robot.cx("290").cy("150");
        }
        if (position.id.localeCompare("tunnel4") == 0) {
          robot.cx("305").cy("265");
        }
        if (position.id.localeCompare("tunnel7") == 0) {
          robot.cx("249").cy("397");
        }
      },
      error: function(data) {
        console.log("Error on updateRobot");
      }
    });
  }, 5000);

}// Fin updateRobot

//Initialisation de la section d'informations générales
function infoMine() {

  setInterval(function () {
    $.ajax({
      url: 'php/Redirection.php',
      data: "requete=infoMine",
      dataType: 'json',
      success: function(data) {

        /***** Paramétrages des progress bar *****/
        var progress1 = ((data[0].dechetExtrait / data[0].dechetTotal) * 100).toFixed(2)+"%";
        document.getElementById('progress1').style.width = progress1;
        document.getElementById('spanProgress1').innerHTML = progress1;

        document.getElementById('progress2').style.width = ((data[0].dechetExtraitMois / (data[0].mouleJour * data[0].capMoule * 30)) * 100).toFixed(2)+"%";
        document.getElementById('spanProgress2').innerHTML = data[0].dechetExtraitMois + "/" + (data[0].mouleJour * data[0].capMoule * 30) + " M³";

        document.getElementById('progress3').style.width = ((data[0].dechetExtraitSemaine / (data[0].mouleJour * data[0].capMoule * 7)) * 100).toFixed(2)+"%";
        document.getElementById('spanProgress3').innerHTML = data[0].dechetExtraitSemaine + "/" + (data[0].mouleJour * data[0].capMoule * 7) + " M³";

        document.getElementById('progress4').style.width = ((data[0].mouleAjd / data[0].mouleJour) * 100).toFixed(2)+"%";
        document.getElementById('spanProgress4').innerHTML = data[0].mouleAjd + "/" + data[0].mouleJour;

        /***** Calcule de l'écart *****/
        var debut = data[0].jourDebut.split("/");
        var date1 = new Date(debut[2], debut[1]-1, debut[0]);
        var date2 = new Date();
        var diffDays = Math.trunc((date2 - date1) / (1000 * 60 * 60 * 24)); // Nb de jour depuis le début
        var ecartMoule = (data[0].dechetExtrait - ((data[0].mouleAjd * data[0].mouleJour) * diffDays)) / data[0].capMoule; // Ecart en nb de moule
        var ecartJour = Math.trunc(ecartMoule / (data[0].mouleJour)); // Ecart en nb de jour
        var str = "";
        if (ecartMoule > 0) {
          if (ecartJour > 0) {
            document.getElementById('ecart').innerHTML = ecartJour + " jour d'avance (+" + ecartMoule + " moules)";
          }
          else {
            document.getElementById('ecart').innerHTML = "+" + ecartMoule + "moules";
          }
          document.getElementById('ecart').style.color = "green";
        }
        else if (ecartMoule < 0) {
          if (ecartJour < 0) {
            document.getElementById('ecart').innerHTML = Math.abs(ecartJour) + " jour de retard (" + ecartMoule + " moules)";
          }
          else {
            document.getElementById('ecart').innerHTML = ecartMoule + "moules";
          }
          document.getElementById('ecart').style.color = "red";
        }
        document.getElementById('jour').innerHTML = "Jour n°" + diffDays;

      },
      error: function(data) {
        console.log("Error on infoMine");
      }
    });
  }, 5000);
} // Fin infoMine

function infoPlus() {

  setInterval(function () {
    $.ajax({
      url: 'php/Redirection.php',
      data: "requete=infoPlus",
      dataType: 'json',
      success: function(data) {
        for (var i = 0; i < data.length; i++) {
          if (data[0].type == 0) {
            setAlerte(data[0]);
          }
          var tr = document.getElementById("alerte" + (i+1))
          var type = "";
          var str = "";
          if (data[i].type == 0) {
            type = "Alarme";
            tr.setAttribute("class", "danger");
          }
          if (data[i].type == 1) {
            type = "Info";
            tr.setAttribute("class", "info");
          }
          str += "<td>" + data[i].date + "</td>";
          str += "<td>" + type + "</td>";
          str += "<td>" + data[i].description + "</td>";
          tr.innerHTML = str;
        }
      },
      error: function(data) {
        console.log("Error on infoPlus");
      }
    });
  }, 1000);
} // Fin infoPlus

function setAlerte(data) {

  var player = document.querySelector('#audioPlayer');
  var intervalAlerte;

  var date1 = new Date(data.date);
  var date2 = new Date();
  var diff = Math.trunc((date2 - date1) / (1000));

  if (diff < 31 && diff > -1) {
    player.play()
    SVG.get("fond").fill("#fc1919");
    SVG.get(data.nomPosition).fill("#ffffff");
    setTimeout(function () {
      SVG.get("fond").fill("#005fbf");
      SVG.get(data.nomPosition).fill("#fc1919");
    }, 500);
  }
  else {
    SVG.get(data.nomPosition).fill("#ffffff");
    player.pause();
    player.currentTime = 0;
  }
} // Fin setAlerte

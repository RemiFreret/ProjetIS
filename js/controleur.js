var draw = SVG('map').size(800, 600)

window.onload = function() {

  $.ajax({
    url: 'php/Redirection.php',
    data: "file=../img/Mine.svg",
    dataType: 'text',
    success: function(data) {
      var rawSvg = data;
      draw.svg(rawSvg)
    },
    error: function(data) {
      console.log("Error on init SVG");
    }
  });

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


} // Fin onload

function initRobot(nbRobot) {

  var robots = [nbRobot];

  for (var i = 0; i < nbRobot; i++) {
    robots[i] = draw.circle(14).id(i+1);
    updateRobot(robots[i]);
  }

} // Fin initRobot

function updateRobot(robot) {

  setInterval(function () {
    $.ajax({
      url: 'php/Redirection.php',
      data: "requete=updateRobot&robot=" + robot.id(),
      dataType: 'json',
      success: function(data) {
        console.log("Success");
        console.log(data);
        var position = SVG.get(data[0].nomPosition).attr();
        var couleur = data[0].couleur;
        //TODO - calculer les coordonées du cercle et le placer
        var x = position.x + (position.width/2);
        var y = position.y + (position.height/2);
        robot.cx(x).cy(y).fill(couleur);
      },
      error: function(data) {
        console.log("Error");
      }
    });
  }, 5000);

}



/************ ZONE DE TEST ************/

//document.getElementById("fond").setAttribute("fill", "#000000");

/*
$("#tunnel1").mouseover( function () {
  console.log(this);
  this.setAttribute("fill", "#000000");
});
*/

/*
$("#tunnel1").hover( function () {
  this.setAttribute("fill", "#000000");
}, function () {
  this.setAttribute("fill", "#ffffff");
} )
*/

//$("#fond").animate({ease: '>', delay: '2.5s'}).attr({ fill: '#000000' }).animate().attr({ fill: '#000000' });

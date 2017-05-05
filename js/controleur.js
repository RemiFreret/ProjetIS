window.onload = function() {

  var draw = SVG('map').size(800, 600)

  $.ajax({
    url: 'php/Redirection.php',
    data: "file=../img/Mine.svg",
    dataType: 'text',
    success: function(data) {
      console.log("Success");
      var rawSvg = data;
      draw.svg(rawSvg)
    },
    error: function(data) {
      console.log("Error");
    }
  });


  setInterval(function robot() {
    $.ajax({
      url: 'php/Redirection.php',
      data: "requete=initRobot",
      dataType: 'json',
      success: function(data) {
        console.log("Success");
        console.log(data);
        for (var i = 0; i < data.length; i++) {
          var position = data[i].nomPosition;
          //TODO - calculer les coordonées du cercle et le placer
        }
      },
      error: function(data) {
        console.log("Error");
      }
    });
  }, 5000);

};

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
//console.log( $("#cave9").attr("x", "y") );

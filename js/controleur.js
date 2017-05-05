window.onload = function() {
  //setInterval(function () { console.log("test"); }, 1000);
  /*
  $.ajax({
    url: 'php/Redirection.php',
    data: "test=valeurTest",
    dataType: 'json',
    success: function(data) {
      console.log("Success");
      console.log(data);
    },
    error: function(data) {
      console.log("Error");
      console.log(data);
    }
  });
  */

  //document.getElementById("fond").setAttribute("fill", "#000000");

  /*
  $("#tunnel1").mouseover( function () {
    console.log(this);
    this.setAttribute("fill", "#000000");
  });
  */
  $("#tunnel1").hover( function () {
    this.setAttribute("fill", "#000000");
  }, function () {
    this.setAttribute("fill", "#ffffff");
  } )
};

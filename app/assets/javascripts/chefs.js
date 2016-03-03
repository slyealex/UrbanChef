// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function geolocationSuccess(position) {
  var longitude = position.coords.longitude;
  var latitude = position.coords.latitude;

  console.log(longitude, latitude);

  $(".location-error").hide();
  $.ajax({
    url: "/chefs",
    method: "GET",
    data: {
      longitude: longitude,
      latitude: latitude
    },
    dataType: "script"
  });
}

  function geolocationError() {
    $(".location-error").show();
  }

$(document).on("ready page:load", function() {
  $("#current_location").click(function(ev) {
    ev.preventDefault();

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("Not supported by your browser ");
    }
  });
});

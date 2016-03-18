// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//
// $(document).on("ready page:load", function () {
//   $("#new_rating").on("submit", function(e) {
//     e.preventDefault();
//
//     var self = $(this);
//
//      $.ajax({
//        url: self.attr("action"),
//        type: self.attr("method"),
//        dataType: "script",
//        data: self.serialize()
//      });
//   });
// });



// Star rating

$(document).on("ready page:load", function () {

  $(function () {

    $("#rateYo").rateYo({
      starWidth: "30px",
      fullStar: true
});


   $("#rateYo").rateYo()
      .on("rateyo.set", function(e, data) {
        var rating = data.rating;
      $("#rating_rating")[0].value = rating;

    });

});

});



    //
    // $(function () {
    //   $("#rateYo_average").rateYo({
    //     starWidth: "35px",
    //     fullStar: true,
    //     readOnly: true
    //   });
    //
    //   // var averegeRating = parseInt("<%= j @average-rating %>");
    //
    //   $("#rateYo_average").rateYo("rating", parseInt("<%= j @average-rating %>"))
    // });





  // $(function () {
  //
  //   $("#rateYo_individual").rateYo({
  //     starWidth: "20px",
  //     fullStar: true,
  //     readOnly: true
  //   });
  //
  // });

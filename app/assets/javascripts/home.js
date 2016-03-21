// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  $(function() {
    $('a.page-scroll').bind('click', function(event) {
       var $anchor = $(this);
       $('html, body').stop().animate({
           scrollTop: $($anchor.attr('href')).offset().top
       }, 1500, 'easeInOutExpo');
       event.preventDefault();
    });
  });

  $(function() {
    setTimeout(function() {
      $(".warpin-start").addClass("warpin");
    }, 100);
  });

  $(function() {
    setTimeout(function() {
      $(".warpin1-start1").addClass("warpin1");
    }, 100);
  });

  $(function() {
    $('a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  });

  $(function() {
    $(".left").click(function(){
    $("#myCarousel").carousel("prev");
    });
  });

  $(function() {
    $(".right").click(function(){
    $("#myCarousel").carousel("next");
    });
  });

});

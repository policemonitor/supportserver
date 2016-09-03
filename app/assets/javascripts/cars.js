$(function () {
  $('[data-toggle="popover"]').popover();

  $("#search-icon").click(function(){
    $(".search-panel").animate({width:'toggle'},450);;
  });
})

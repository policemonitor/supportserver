
$(function () {
  $('[data-toggle="popover"]').popover();

  $("#search-icon").click(function(){
    $(".search-panel").animate({width:'toggle'},450);;
  });

  $(".crew-item").on("click", function() {
    move_map_to($(this).data("lat"), $(this).data("lng"));
  });
})

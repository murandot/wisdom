$(document).on('turbolinks:load', function() {
  $('.user-icon').on('click',function(){
    if($(".user-menu").hasClass("hidden")){
      $(".user-menu").removeClass("hidden");
      $(".user-menu").slideDown();
    } else {
      $(".user-menu").addClass("hidden");
      $(".user-menu").slideUp();
    }
  });
});
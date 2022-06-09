$(document).on('turbolinks:load', function() { 
  $('.upload-btn').on('click',function(){
    if($(".upload-menu").hasClass("hidden")){
      $(".upload-menu").removeClass("hidden");
      $(".upload-menu").slideDown();
    } else {
      $(".upload-menu").addClass("hidden");
      $(".upload-menu").slideUp();
    }
  });
});
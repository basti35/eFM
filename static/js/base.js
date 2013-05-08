$(document).ready(function() {


  $('.viesti').delay(3000).fadeOut(500);
  
  // fading
  $(".sisalto").css("display", "none");

    $(".sisalto").fadeIn(1000);
    
  $("a.transition").click(function(event){
    event.preventDefault();
    linkLocation = this.href;
    $(".sisalto").fadeOut(500, redirectPage);    
  });
    
  function redirectPage() {
    window.location = linkLocation;
  }

  $("[rel='tooltip']").tooltip();


});
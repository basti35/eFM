// executed when page loaded:
$(document).ready(function() {
  $('.tulos').css("display", "none");
});

// executed when
$('#lataus').click(function(){
  $('.loading').delay(4000).fadeOut(500);
  $('.tulos').delay(4500).fadeIn(500);

});

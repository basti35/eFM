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

  // tooltips
  $("[rel='tooltip']").tooltip();

  // nicescroll
  $("html").niceScroll({cursorborder:"",cursorcolor:"#666",boxzoom:true});

});





/**
 * Adds 0 left margin to the first thumbnail on each row that don't get it via CSS rules.
 * Recall the function when the floating of the elements changed.
 */
function fixThumbnailMargins() {
    $('.row-fluid .thumbnails').each(function () {
        var $thumbnails = $(this).children(),
            previousOffsetLeft = $thumbnails.first().offset().left;
        $thumbnails.removeClass('first-in-row');
        $thumbnails.first().addClass('first-in-row');
        $thumbnails.each(function () {
            var $thumbnail = $(this),
                offsetLeft = $thumbnail.offset().left;
            if (offsetLeft < previousOffsetLeft) {
                $thumbnail.addClass('first-in-row');
            }
            previousOffsetLeft = offsetLeft;
        });
    });
}

// Fix the margins when potentally the floating changed
$(window).resize(fixThumbnailMargins);

fixThumbnailMargins();


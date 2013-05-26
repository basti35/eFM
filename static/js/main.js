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

// equalizes the heights of thumbnail boxes
function equalHeight(group) {    
    tallest = 0;    
    group.each(function() {       
        thisHeight = $(this).height();       
        if(thisHeight > tallest) {          
            tallest = thisHeight;       
        }    
    });    
    group.each(function() { $(this).height(tallest); });
}



// GENERAL FUNCTIONS

// executed when page loaded:
$(document).ready(function() {

  // tooltips
  $("[rel='tooltip']").tooltip();

  // nicescroll
  $("html").niceScroll({cursorborder:"",cursorcolor:"#666",boxzoom:true});

  // equalheight
  equalHeight($(".equalize"));

  // fix thumbnails
  fixThumbnailMargins();

  // Piilota moduli
  $(".sulje").click(function () {
    $(this).closest('li').slideUp('slow');
  });

  // fading in
  $(".sisalto").css("display", "none");
  $(".sisalto").fadeIn(1000);


  // valo paalle
  $(".multiswitch-on").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOn(2,0)',
      type: 'GET',
    });
  });

  // valo pois
  $(".multiswitch-off").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOff(2,0)',
      type: 'GET',
    });
  });


});


$(window).load(function(){
  $('#dvLoading').fadeOut(2000);
});



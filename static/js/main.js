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

  // equalheight
  equalHeight($(".equalize"));

});



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

$(document).ready(function() {   
    equalHeight($(".equalize")); 
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




// Piilota moduli
$(".sulje").click(function () {
  $(this).closest('li').slideUp('slow');
});



// valo paalle
$("#valo-on").click(function () {
  $.ajax({        
    url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOn(2,0)',
    type: 'GET',
  });
});

// valo pois
$("#valo-off").click(function () {
  $.ajax({        
    url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOff(2,0)',
    type: 'GET',
  });
});



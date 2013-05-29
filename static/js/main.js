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



// after page loaded:
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

  $(".websulki").click(function () {
    $(this).closest('.well').slideUp('slow');
  });

  // lauch create app dialog if allowed
  $('#myModal').modal('show')


  // scanning sensors
  $('.lataus').delay(4000).fadeOut(500);
  $('.tulos').delay(4500).fadeIn(500);


// --- DEVICE CONTROLS -------------------


  // 03 multiswitch
  $(".multiswitch-on").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOn(2,0)',
      type: 'GET',
    });
  });
  $(".multiswitch-off").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOff(2,0)',
      type: 'GET',
    });
  });


  // 04 lampswitch
  $(".lampswitch-on").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOn(4,0)',
      type: 'GET',
    });
  });
  $(".lampswitch-off").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:8083/JS/Run/SwitchBinaryOff(4,0)',
      type: 'GET',
    });
  });


  // 06 switch
  $(".switch-06-on").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:83/domotiga/index.php?action=On&name=06',
      type: 'GET',
    });
  });
  $(".switch-06-off").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:83/domotiga/index.php?action=Off&name=06',
      type: 'GET',
    });
  });

  // 08 switch
  $(".switch-08-on").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:83/domotiga/index.php?action=On&name=08',
      type: 'GET',
    });
  });
  $(".switch-08-off").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:83/domotiga/index.php?action=Off&name=08',
      type: 'GET',
    });
  });

  // 12 switch
  $(".switch-12-on").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:83/domotiga/index.php?action=On&name=12',
      type: 'GET',
    });
  });
  $(".switch-12-off").click(function () {
    $.ajax({        
      url: 'http://dosa.homeip.net:83/domotiga/index.php?action=Off&name=12',
      type: 'GET',
    });
  });




// -------------------------------------



});









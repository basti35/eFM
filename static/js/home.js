var timeoutID;
 
function delayedAlert() {
  timeoutID = window.setTimeout(slowAlert, 2000);
}

function slowAlert() {
  $('#myModal').modal('show');
}



// executed when page loaded:
$(document).ready(function() {

	delayedAlert()

});
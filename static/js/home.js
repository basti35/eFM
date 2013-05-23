var timeoutID;
 
function delayedAlert() {
  timeoutID = window.setTimeout(slowAlert, 2000);
}

function slowAlert() {
  $('#myModal').modal('show');
}



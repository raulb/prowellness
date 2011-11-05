MODAL = {
  open: function() {
    //Get the A tag
    var id = $('#modal-window');
    
    //Get the screen height and width
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    //Set height and width to mask to fill up the whole screen
    $('.overlay-layer').css({'width':maskWidth,'height':maskHeight});

    //transition effect
    $('.overlay-layer').hide().fadeIn(100,function() {

          //transition effect
          $(id).fadeIn(250);});

    // $('#mask').fadeTo(500,0.8);
    //Get the window height and width
    var winH = $(window).height();
    var winW = $(window).width();

    //Set the popup window to center
    $(id).css('top',winH/2-($(id).height()/2)+window.pageYOffset);
    // center
    // $(id).css('top',  winH/2-$(id).height()/2);
    $(id).css('left', winW/2-$(id).width()/2);
  }
}

$(document).ready( function() {
  //if close button is clicked
  $('.close').click(function (e) {
     //Cancel the link behavior
     e.preventDefault();
     $('.window').hide();
  });

  //if mask is clicked
  $('.overlay-layer').click(function () {
     $(this).hide();
     $('.window').hide();
  });
  
  $('#modal-window .login').click(function(event) {
    $('.overlay-layer').hide();
    $('.window').hide();
    $('li.login .options').show();
    $('#email').focus();
  });
});
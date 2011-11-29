MODAL = {
  open: function(id) {

    //Get the screen height and width
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    //Set height and width to mask to fill up the whole screen
    $(id).parent().children('.overlay-layer').css({'width':maskWidth,'height':maskHeight});

    //transition effect
    $(id).parent().children('.overlay-layer').hide().fadeIn(100,function() {
      $(id).fadeIn(250);

      if ($(id).hasClass('window-send-book')) {
        $(id).find('#email').focus();
      }
    });

    //Get the window height and width
    var winH = $(window).height();
    var winW = $(window).width();

    //Set the popup window to center
    $(id).css('top',winH/2-($(id).height()/2)+window.pageYOffset);
    // center
    // $(id).css('top',  winH/2-$(id).height()/2);
    $(id).css('left', winW/2-$(id).width()/2);
  },
  remove: function(id){
    $(id).parent().remove();
  }
}

$(document).ready( function() {

  //if close button is clicked
  $('.close').live('click',function (e) {
     //Cancel the link behavior
     e.preventDefault();

     $('.modal-window').hide();
     $('.overlay-layer').hide();
  });

  //if mask is clicked
  $('.overlay-layer').live('click',function () {
    $('.modal-window').hide();
     $(this).hide();
  });

  $('.modal-window .login').live('click',function(event) {
    $('.overlay-layer').hide();
     $('.modal-window').hide();
    $('li.login #login_form').show();
    $('#email').focus();
  });
});
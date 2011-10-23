// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//

//= require jquery-1.6.2.min
//= require jquery-ui-1.8.16.custom.min
//= require jquery.scrollTo-min
//= require jquery_ujs
//= require jquery.sausage

jQuery(document).ready(function($) {
  
  // hover social icons (FOOTER)
  $('footer').find('a').hover(function() {
    $(this).parent().children('p').show();
  }, function() {
    $(this).parent().children('p').hide();
  });


  // click over li element and navigate to its real link element
  $('.info-box ul li').click(function(event) {
    window.location = $(this).children('a').attr('href');
  });

  // To show submenu options
  $("li.articles,li.visual-guide").hover(function() {
    $(this).find('.options').show();
  }, function() {
    $(this).find('.options').hide();
  });


  // Showing login options
  $('li.login').find('a').click(function(event) {
    event.preventDefault();

    var el = $(this).parents('.login').children('.options');
    showLoginWindow(el);

  });

  $('input.error').click(function(event) {
    // Only applied when it's coming from an error action (placeholder contains the error message)
    if ($(this).val() == $(this).attr('placeholder')) {
     $(this).val(''); 
    }
  });

});


// PUBLIC SCOPE
function showLoginWindow(el){
  if (el.is(':visible')){
    el.hide();
    document.unbind('click');
  }else{
    el.show();
    $('#email').focus();

    $(document).click(function(event) {
      if (!$(event.target).closest('li.login').length)
      {
        el.hide();
        // document.unbind('click');
      };
    });
    // To hide any element when it's clicked outside
  }
}

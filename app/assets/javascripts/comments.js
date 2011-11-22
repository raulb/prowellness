jQuery(document).ready(function($) {
  $('.click_link').click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    
    $.scrollTo('li.login',400); 

    var el = $('li.login').children('#login_form');
    showLoginWindow(el)
    
  });
  
});

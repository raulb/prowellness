//= require jquery
//= require jquery_ujs

jQuery(document).ready(function() {
  
  // At the beginning, we need to paste the original content to its editable elem
  $('#edit_body').html($('#post_body').html());
  
  $('input[type="submit"]').click(function(event) {
    console.log('body ', $('#edit_body').html());
    console.log('body sin html ', $('#edit_body'));
    
    
    $('#post_body').html($('#edit_body').html());
  });
});

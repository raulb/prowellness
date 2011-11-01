jQuery(document).ready(function() {

  Galleria.loadTheme('assets/galleria-themes/galleria.classic.min.js');
  
  $('.content').each(function(index) {
    var set_id = $(this).attr('id');
    $(this).galleria({
      flickr: 'set:'+set_id,
        flickrOptions: {
          sort: 'date-posted-asc'
        }
    });
  });
  
  $('.header').click(function(event) {
    event.preventDefault(); 
    event.stopPropagation();
    
    $(this).parent().children('.gallery').slideToggle('fast');
    
  });
  
  
});

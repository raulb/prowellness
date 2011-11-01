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
  
  
  
});

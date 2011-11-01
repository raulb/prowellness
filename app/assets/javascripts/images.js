jQuery(document).ready(function() {

  Galleria.loadTheme('assets/images-theme/galleria.classic.js');
  
  $('.header').click(function(event) {
    event.preventDefault(); 
    event.stopPropagation();
    
    var el = $(this).parent().children('.gallery');
    
    el.slideToggle('fast');
    
    if (el.find('.galleria-container').length == 0) {
      
      var set_id = el.children('.content').attr('id');
      
      el.children('.content').galleria({
        imageCrop:'height',
        showInfo:false,
        thumbFit:true,
        thumbCrop:false,
        showCounter:false,
        flickr: 'set:'+set_id,
          flickrOptions: {
            sort: 'date-posted-asc'
          }
      });
      
    }
    
  });
  
  
});

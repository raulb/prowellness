jQuery(document).ready(function() {
  
  var indexActive = $('#index-books').children('.current').children('a').attr('rel');
  showBook(indexActive);

  
  
});


function showBook(index) {
 var el = $('#books').children('li');
 
 el.not(el.eq(index)).fadeOut('fast',function(){
   el.eq(index).fadeIn('slow');
   
   //  Activate index
   $('#index-books').children('li.current').removeClass('current');
   $('#index-books').children('li').eq(index).addClass('current');
   
   $('#main-book-option').children('.current').removeClass('current');
   $('#main-book-option').children('a').eq(index).addClass('current');
  
 });

}
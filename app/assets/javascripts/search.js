jQuery(document).ready(function($) {
  $('.filters').hide();
  
  $('.toggle_filters').click(function(e){
    
    $('.filters').slideToggle('fast');

    // TODO: Should I clean filters when it's hidden?
    e.stopPropagation(); e.preventDefault();
  });

  var page = 1,
      loading = false;

  function nearBottomOfPage() {
    if ($('.post').length > 0) return $(window).scrollTop() > $('.post:last').position().top - 300;
    return false;
  }

  $(window).scroll(function(){
    if (loading) {
      return;
    }

    if(nearBottomOfPage()) {
      loading=true;
      page++;
      $.ajax({
        url: $('a[rel=pagination]').attr('href') + '&page=' + page,
        type: 'get',
        dataType: 'script',
        success: function() {
          $(window).sausage('draw');
          loading=false;
        }
      });
    }
  });

  $(window).sausage();
  
  // Datepicker for search dates
  var dates = $( "#date_from, #date_to" ).datepicker({
    changeMonth: true,
    numberOfMonths: 1,
    onSelect: function( selectedDate ) {
      var option = this.id == "date_from" ? "minDate" : "maxDate",
      instance = $( this ).data( "datepicker" ),
      date = $.datepicker.parseDate(
        instance.settings.dateFormat ||
        $.datepicker._defaults.dateFormat,
        selectedDate, instance.settings );
        dates.not( this ).datepicker( "option", option, date );
        
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        
        // Set value to the select_date element rails
        if (this.id == 'date_from'){
          $('#from_day').val(day);
          $('#from_month').val(month);
          $('#from_year').val(year);
        }else {
          $('#to_day').val(day);
          $('#to_month').val(month);
          $('#to_year').val(year);
        }
        
      }
    },$.datepicker.regional["es"]);

});

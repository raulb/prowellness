jQuery(document).ready(function($) {
  
  if ($('.custom-select').length > 0){
    $('.custom-select').sSelect();
  }
  
	$('.filters').hide();

  $('.toggle_filters').live('click',function(e){
    $('.filters').slideToggle('fast');
    e.stopPropagation(); e.preventDefault();
  });

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
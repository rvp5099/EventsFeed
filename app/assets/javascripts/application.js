// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function() {
    // initialize input widgets first
  //  $('#event_start_date .time').timepicker({
  //      'showDuration': true,
  //      'timeFormat': 'g:ia'
  //  });

    $('#event_start_date .date').datepicker({
        'format': 'm/d/yyyy',
        'autoclose': true
    });

    // initialize datepair
    //$('#events_start_date').datepair();

  //  $('#event_end_date .time').timepicker({
  //      'showDuration': true,
  //      'timeFormat': 'g:ia'
  //  });

    $('#event_end_date .date').datepicker({
        'format': 'm/d/yyyy',
        'autoclose': true
    });
});


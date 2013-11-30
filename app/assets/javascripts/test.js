$(function() {

  $('#main-header').append('<h2 id="log">ready</h1>')

  $( window ).resize(function() {
    $( "#log" ).text( $( window ).width() );
  });

});
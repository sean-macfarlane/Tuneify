// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.history
//= require jquery.rails-ajax
//= require RailsAjax-Config
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .



 $(document).on('page:change', function () {
    var audioSection = $('section#song');
	$(document).on("click", 'a.play_song', function(e) {
        var audio = $('<audio>', {
             controls : 'controls'
        });
 
        var url = $(this).attr('href');
        $('<source>').attr('src', url).appendTo(audio);
        audioSection.html(audio);
        return false;
    });
});

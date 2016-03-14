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
//= require jquery.jplayer
//= require jquery.history
//= require jquery.rails-ajax
//= require RailsAjax-Config
//= require bootstrap-sprockets
//= require turbolinks


 $(document).on('page:change', function () {
	 $("#jquery_jplayer_1").jPlayer({
        cssSelectorAncestor: "#jp_container_1",
        swfPath: "/js",
		wmode: "window",
        supplied: "m4a, oga, mp3",
        useStateClassSkin: true,
        autoBlur: false,
        smoothPlayBar: true,
        keyEnabled: true,
        remainingDuration: true,
        toggleDuration: true
      });

	 
    var audioSection = $('section#song');
	$(document).on("click", 'a.play_song', function(e) {
        $("#jquery_jplayer_1")
        .jPlayer("setMedia", {mp3: this.href })
        .jPlayer("play");
        return false;
    });
});








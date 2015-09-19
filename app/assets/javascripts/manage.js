// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require jquery-ui
//= require twitter/bootstrap
//= require jquery.slimscroll.min
//= require extents
//= require sidebar
//= require jquery.gritter.min
//= require jquery.pulsate.min
//= require ckeditor/init
//= require manage/posts
//= require chosen-jquery


$('.trigger-user-settings').pulsate({
    color:"#f89406", // set the color of the pulse
    reach: 20,                              // how far the pulse goes in px
    speed: 1000,                            // how long one pulse takes in ms
    pause: 0,                               // how long the pause between pulses is in ms
    glow:false,                           // if the glow should be shown too
    repeat: true,                           // will repeat forever if true, if given a number will repeat for that many times
    onHover: false                          // if true only pulsate if user hovers over the element
});

$(function(){
    $('.menu').slimScroll({
        height: '600px'
    });
});







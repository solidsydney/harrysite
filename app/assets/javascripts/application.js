// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require jquery.stellar
//= require jquery-migrate-1.2.1

//= require jquery.countdown
//= require fluidvids
//= require retina-1.1.0.min
//= require jquery.resizestop.min
//= require main
//= require nprogress
//= require nprogress-turbolinks
//= require google-analytics-turbolinks
//= require contacts
//= require jquery.flexslider
//= require shCore
//= require shBrushXml
//= require shBrushJScript
//= require jquery.easing
//= require jquery.mousewheel
//= require masonry/jquery.masonry
//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require categories


$(function(){
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: false
    });
});

$(function(){

    var $container = $('#masonry-container');

    $container.imagesLoaded(function(){
        $container.masonry({
            itemSelector: '.box',
            isAnimated: !Modernizr.csstransitions
        });
    });
});












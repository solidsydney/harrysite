/*
 * Jquery Content Slider Plugin
 * MailTo: Avihay@vsense.co.il
 *
 * Copyright 2012, Avihay Menahem
 *
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 *
 */

(function ($) {
  $.fn.cSlider = function(options) {
		
		var settings = $.extend({
			'width' : 700, // Slider Width
			'height' : 400, // Slider Height
			'speed' : 400, // Slides Animation Speed
			'ease' : 'swing', // Slides Animation Ease
			'arrows' : true, // Display Arrows True/False
			'navigation' : true, // Display Navigation Bar True/False
			'captions' : true, // Display Image Captions True/False (By Title Attribute)
			'timer' : true, // Slideshow Timer True/False
			'time' : 5000 // How Much Time Beetwen Each Slideshow In Seconds (1000 equals 1s)
		}, options);
  
    return this.each(function(){

			// The Slider Element
			var slider = $(this);
			
			// The Settings
			var arrows = settings['arrows'];
			var navigation = settings['navigation'];
			var imgCaptions = settings['captions'];
			var animationType = settings['ease'];
			var animationSpeed = settings['speed'];
			var sliderSize = settings['width'];
			var sliderHeight = settings['height'];
			var timer = settings['timer'];
			var time = settings['time'];
			
			// The Number Of Slider Slides
			var numElements = slider.find(".content ul li").length;
			
			// Some Default Configuration, DO NOT TOUCH
			var current = -(sliderSize*2);
			
			// Some Basic Configuration To Set The Slider Size
			slider.css('width', sliderSize);
			slider.css('height', sliderHeight);
			slider.find(".content").css({'width' : sliderSize ,'height' : sliderHeight });
			slider.find(".content ul").css({'width' : numElements * sliderSize ,'height' : sliderHeight, 'left': current });
			slider.find(".content li").css({'width' : sliderSize ,'height' : sliderHeight });
			slider.find(".content li:first").addClass("active");
			slider.find('.content ul').prepend(slider.find(".content li:nth-child(3)"));
			slider.find('.content ul').prepend(slider.find(".content li:nth-child(4)"));
			
			// Set The Arrows Navigation If True
			if(arrows === true) { slider.append('<div class="left arrow"></div><div class="right arrow"></div>'); }
			
			
			// Timer Initialization
			if(timer === true)
			{
				rotate = function() { slider.find(".right").click(); };
				var interval = window.setInterval(rotate,time);

				slider.find("li").hover(function(){
					clearInterval(interval);
				},function(){
					interval = window.setInterval(rotate,time);
				});
				slider.find("div.arrow").hover(function(){
					clearInterval(interval);
				},function(){
					interval = window.setInterval(rotate,time);
				});
				
			}
			
			// Set The Navigation Bar If True
			if(navigation === true) {
				slider.append('<div class="navigation"><ul></ul></div>');
				var navH = sliderHeight+slider.find(".navigation").height();
				slider.height(navH);
				for(i = 0; i < numElements; i++) { slider.find(".navigation ul").append('<li>'+i+'</li>'); }
				slider.find(".navigation li:first").addClass("active");
			}
			
			// Set The Image Captions If True
			if(imgCaptions === true) {
				slider.find(".content ul li img").each(function(){
					$(this).after('<div class="imgCaption">'+$(this).attr("title")+'</div>');
				});
			}
			
			// Navigation Bar Click Function
			slider.find(".navigation ul li").live('click', function(){
				slider.find(".navigation ul li.active").removeClass("active");
				$(this).addClass("active");
				var move = $(this).html() * -(sliderSize);
				slider.find(".content ul").animate({
					left :  move
				}, animationSpeed, animationType,function(){
					current = move;
				});
				nth = $(this).index() + 1;
			});
			
			// Right Arrow Click Function
			slider.find(".right").live('click',function(){
				slider.find(".content ul").animate({
					left: current-sliderSize
				},animationSpeed,animationType,function(){
					$(this).find('li:first').appendTo(this);
					$(this).css({'left':current});
				});
				slider.find(".content ul li.active").removeAttr("class");
				slider.find(".content ul li:nth-child(4)").addClass("active");
			});
			
			// Left Arrow Click Function
			slider.find(".left").live('click',function(){
				slider.find(".content ul").animate({
					left: current+sliderSize
				},animationSpeed,animationType,function(){
					$(this).find('li:last').prependTo(this);
					$(this).css({'left':current});
				});
				slider.find(".content ul li.active").removeAttr("class");
				slider.find(".content ul li:nth-child(2)").addClass("active");
			});
			
		});
  };
})( jQuery );
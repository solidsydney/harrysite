$( document ).ready(function() {

	var popularSlider;
   
	var countBackgroundSpeed = function() {
		var url = $('body').css('background-image').replace('url(', '').replace(')', '').replace("'", '').replace('"', '');
		
		windowHeight = $(window).height();
		contentHeight = $('html').height();
	    var bkImg = new Image();
		    bkImg.onload = function() {
		       var  H = this.height,
           			W = this.width;
           		ratio = (H-windowHeight)/(contentHeight-windowHeight);
           		
           		$( "body" ).attr( "data-stellar-background-ratio", ratio);
           		$('body').stellar();
		    }
		    bkImg.src = url;
		
	};

	var initSliders = function(){
		$('.news').bxSlider({
		  speed: 3000,
		  touchEnabled: true,
		  nextSelector: ".breaking>.controls .next",
		  prevSelector: ".breaking>.controls .prev",
		  pager: false,
		  infiniteLoop: true,
		  adaptiveHeight: true,
		  auto: true,
		  pause: 4000

		});

		var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
		if(width>767){
			  popularSlider = $('.popular>.gallery').bxSlider({
				  speed: 600,
				  minSlides: 4,
			  	  maxSlides: 4,
			  	  slideWidth: 5000,
			  	  slideMargin: 20,
				  touchEnabled: true,
				  nextSelector: ".popular .gallery-nav .next",
				  prevSelector: ".popular .gallery-nav .prev",
				  pager: true,
				  infiniteLoop: true,
				  pagerSelector: ".popular .pager",
				  auto: true,
				  pause: 4000
				});
		}else{
			popularSlider = $('.popular>.gallery').bxSlider({
				  speed: 300,
				  minSlides: 1,
			  	  maxSlides: 1,
			  	  slideWidth: 5000,
				  touchEnabled: true,
				  nextSelector: ".popular .gallery-nav .next",
				  prevSelector: ".popular .gallery-nav .prev",
				  pager: true,
				  infiniteLoop: true,
				  pagerSelector: ".popular .pager",
				  auto: true,
				  pause: 4000
				});
		}

		
		$('.post-slider .slides').bxSlider({
		  speed: 600,
		  touchEnabled: true,
		  pager: false,
		  infiniteLoop: true,
		  nextSelector: ".post-slider .controls .next",
		  prevSelector: ".post-slider .controls .prev",
		  fadeText: true,
		  auto: true,
		  pause: 10000

		});
	}



	$(window).load(function(){
		var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
		if(width>767){
	  		countBackgroundSpeed();
	  	};
	  	initSliders();	  
	});
	
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	})

	
	$('#register').on('show', function () {
	  $('#login').modal('hide');
	})

	var countdownDate = new Date(); 
	countdownDate = new Date(2014,1,1); 
	$('#countdown').countdown({until: countdownDate}); 

	
	$('.form-search .search-query').focusin(function (e) {
		$( this ).parent().find(".btn").css("borderLeft","1px solid #0091ff")
	});

	$('.form-search .search-query').focusout(function (e) {
		$( this ).parent().find(".btn").css("borderLeft","1px solid #ddd")
	});



	


	Fluidvids.init({
	    selector: 'iframe',
	    players: ['www.youtube.com', 'player.vimeo.com']
	  });



	$("#menu-button").on('click', function(e) {  
        e.preventDefault();  
        $('ul.menu').slideToggle();  
    });  

    $("#header-menu-button").on('click', function(e) {  
        e.preventDefault();  
        $('header nav>ul').slideToggle();  
    });  


});

 

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

 

$(window).load(function() { 
  $("#preloader").fadeOut("slow"); 
  $("body").addClass('active');

  //add class to button for wished transition
  $('header .text a').delay(3600).queue(function(){$(this).addClass('normal')
  });

});

$(document).ready( function () {

    $('textarea').autosize();

    var window_width = $(window).width();
    var window_height = $(window).innerHeight();
    //HEIGHT OF HEADER
    $('header').css('height', window_height);
    
    //SCROLL OVER HEADER MAKES NAV FIXED TO THE TOP
    var navigation = $('header nav');
    $(window).scroll(function() {
      if ($(window).scrollTop()>(window_height - 81)) {
        navigation.addClass('fixed');
        navigation.delay(1000).queue(function(){$(this).addClass('animate')
    });
      }
      else {
        navigation.removeClass('fixed animate');
      }
    });

    //scroll to the top icon
    var to_top_icon = $('#to_the_top');
    $(to_top_icon).hide();
    $(window).scroll(function(){
        if ($(this).scrollTop() > window_height - 79) {
            to_top_icon.fadeIn();
        } else {
            to_top_icon.fadeOut();
        }
    });

    // magnific popup////////////////////////////////////

    $('.popup-gallery').magnificPopup({
      delegate: 'a',
      type: 'image',
      gallery: {
        enabled: true
      },
      zoom: {
        enabled: true, // By default it's false, so don't forget to enable it

        duration: 600, // duration of the effect, in milliseconds
        easing: 'ease-in-out', // CSS transition easing function 

        // The "opener" function should return the element from which popup will be zoomed in
        // and to which popup will be scaled down
        // By defailt it looks for an image tag:
        opener: function(openerElement) {
          // openerElement is the element on which popup was initialized, in this case its <a> tag
          // you don't need to add "opener" option if this code matches your needs, it's defailt one.
          return openerElement.is('img') ? openerElement : openerElement.find('img');
        }
      }
    });

  $('.popup-youtube, .popup-vimeo').magnificPopup({
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,

    fixedContentPos: true
  })


  //on resize run function
  var tOut = false;
  var milSec = 500;
  $(window).resize(function(){
   if(tOut !== false)
      clearTimeout(tOut);
   tOut = setTimeout(rsizeItems, milSec);
  });
  function rsizeItems() 
  { 
    var window_height = $(window).innerHeight();
    //HEIGHT OF HEADER
    $('header').css('height', window_height);
    //SCROLL OVER HEADER MAKES NAV FIXED TO THE TOP
    $(window).scroll(function() {
      if ($(window).scrollTop()>(window_height - 81)) {
        $('header nav').addClass('fixed');
      }
      else {
        $('header nav').removeClass('fixed');
      }
    });
  }

  // ABOUT SECTION ////////////////////////
  /////////////////
  $('#about .read_more').click(function(e){
    e.preventDefault();

    
    var top_ofset = $('header nav.fixed').outerHeight() - 1;
    $('html, body').animate({
    scrollTop: $( $(this).attr('href') ).offset().top - top_ofset
    }, 500);   
     
    var close = "<a href='' class='close'>Close</a>";
    var article = $('#about article');
    article.hide();
    $(this).parent().parent().parent().addClass('about-show');
    var locate_content = $(this).attr('href');
    $(locate_content).addClass('active').children('.container').append(close);

    $('#about .close').click(function(e){
      e.preventDefault();
      $(this).parent().parent().removeClass('active').parent().removeClass('about-show').find('article').fadeIn();
    })
  });


  // MORE INFO//////////////////////////////////////////////

  $('#contact .info h6').click(function(){
    if ($(this).parent().hasClass("active")) {
        $(this).text("More info")
        $(this).parent().removeClass('active');
    }
    else {
        $(this).text("Close")        
        $(this).parent().addClass('active');
    }
  });


  // HEADER DROP-DOWN MENU /////////////////////////////////
    
  $('header nav span').click(function(){
    $(this).toggleClass('active').next().toggleClass('active');
  });


/*
  $('header nav ul li a').click(function(e){
    e.preventDefault();
    $(this).parent().parent().removeClass('active').prev().removeClass('active');
  });
*/


  jQuery(function() {
    jQuery('#bannerscollection').bannerscollection_zoominout({
      responsive:true,
      responsiveRelativeToBrowser: true,
      width: 1920,
      height: 1200,
      enableTouchScreen: false,
      width100Proc:true,
      height100Proc:true,
      showNavArrows:false,
      showBottomNav:false,
      autoHideBottomNav:true,
      autoPlay: 10,
      pauseOnMouseOver:false
    });   
    
  });

  // //scroll page////////////////////////////////////////
  var top_ofset = $('header nav').height() - 1;


  // for smooth scroll page we used this plugin https://github.com/kswedberg/jquery-smooth-scroll
 /* $('header nav a, #to_the_top, .scroll_down, #member_info .person_info a').smoothScroll({
    offset: - top_ofset,
    // one of 'top' or 'left'
    direction: 'top',
    // only use if you want to override default behavior
    scrollTarget: null,
    // fn(opts) function to be called before scrolling occurs.
    // `this` is the element(s) being scrolled
    beforeScroll: function() {},
    // fn(opts) function to be called after scrolling occurs.
    // `this` is the triggering element
    afterScroll: function() {},
    speed: 600,
    easing: 'easeInOutExpo',
    // coefficient for "auto" speed
    autoCoefficent: 1,
    // $.fn.smoothScroll only: whether to prevent the default click action
    preventDefault: true      
  });*/


  //MAKE ACTIVE HEADER LINKS
    // Cache selectors
   /* var lastId,
        topMenu = $("header .nav"),
        topMenuHeight = topMenu.outerHeight()+15,
        // All list items
        menuItems = topMenu.find("a"),
        // Anchors corresponding to menu items
        scrollItems = menuItems.map(function(){
          var item = $($(this).attr("href"));
          if (item.length) { return item; }
        });
*/
    // Bind click handler to menu items
    // so we can get a fancy scroll animation
    // menuItems.click(function(e){
    //   var href = $(this).attr("href"),
    //       offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
    //   $('html, body').stop().animate({ 
    //       scrollTop: offsetTop
    //   }, 300);
    //   e.preventDefault();
    // });

    // Bind to scroll
/*    $(window).scroll(function(){
       // Get container scroll position
       var fromTop = $(this).scrollTop()+topMenuHeight;
       
       // Get id of current scroll item
       var cur = scrollItems.map(function(){
         if ($(this).offset().top < fromTop)
           return this;
       });
       // Get the id of the current element
       cur = cur[cur.length-1];
       var id = cur && cur.length ? cur[0].id : "";
       
       if (lastId !== id) {
           lastId = id;
           // Set/remove active class
           menuItems
             .parent().removeClass("active")
             .end().filter("[href=#"+id+"]").parent().addClass("active");
       }                   
    });*/

  // IN-VIEW/////////////////////////////////////////////

  $(' #belive, #subscribe, #clients, .awesome-page, #about, .popup-gallery, #pricing').bind('inview', function(event, isInView, visiblePartX, visiblePartY) {
    if (isInView) {
      $(this).addClass('active');
    }
  }); 

  $('#contact').bind('inview', function(event, isInView, visiblePartX, visiblePartY) {
    if (isInView) {
      $(this).addClass('active').delay(2000).queue(function(){
          $(this).addClass('active1');
      });
    }
  });
  
 


     
  // init FILTER///////////////////////////////////////


  $('#grid').mixitup({
    targetSelector: '.mix',
    filterSelector: '.filter',
    sortSelector: '.sort',
    buttonEvent: 'click',
    effects: ['fade','scale'],
    listEffects: null,
    easing: 'cubic-bezier(.59,.05,.4,.99)',
    layoutMode: 'grid',
    targetDisplayGrid: 'inline-block',
    targetDisplayList: 'block',
    gridClass: '',
    listClass: '',
    transitionSpeed: 300,
    showOnLoad: 'all',
    sortOnLoad: false,
    multiFilter: false,
    filterLogic: 'or',
    resizeContainer: true,
    minHeight: 0,
    failClass: 'fail',
    perspectiveDistance: '3000',
    perspectiveOrigin: '50% 50%',
    animateGridList: true,
    onMixLoad: null,
    onMixStart: null,
    onMixEnd: null
  });


  // TEAM SLIDER ///////////////////////////////////////////
  var owl = $("#owl1");

    owl.owlCarousel({
    itemsCustom : [
    [0, 1],
    [630, 2],
    [900, 3],
    [1150, 4]
    ],
    navigation : true
     
  });

  $('#team .item').click(function(e){
    e.preventDefault();
    var slider = $('#team_slider_wrap');
    slider.hide();
    $(this).parents('#team').addClass('member-show');
    var locate_member = $(this).children().children().attr('href');
    $(locate_member).addClass('active');

    $('#team .close').click(function(e){
      e.preventDefault();
      $(this).parent().parent().removeClass('active').parents('#team').removeClass('member-show').find('#team_slider_wrap').fadeIn();
    })
  });


  // SLIDER2//////////////////////////////////////////////
  
  var owl = $("#owl2");
 
    owl.owlCarousel({
    itemsCustom : [
    [0, 1],
    [450, 2],
    [600, 3],
    [700, 4],
    [1000, 5]
    ],
    navigation : true
   
  });  


  //INPUTS////////////////////////////////////////////////

    $('[placeholder]').focus(function() {
      var input = $(this);
      if (input.val() == input.attr('placeholder')) {
        if (this.originalType) {
          this.type = this.originalType;
          delete this.originalType;
        }
        input.val('');
        input.removeClass('placeholder');
      }
    }).blur(function() {
      var input = $(this);
      if (input.val() == '' || input.val() == input.attr('placeholder')) {
        if (this.type == 'password') {
          this.originalType = this.type;
          this.type = 'text';
         }
        input.addClass('placeholder');
        input.val(input.attr('placeholder'));
      }
    }).blur().parents('form').submit(function() {
      $(this).find('[placeholder]').each(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
          input.val('');
        }
      })
    });
    
    //anti spam form secure and validate///////////////////
     var word = ['one', 'two', 'three', 'four', 'five'];
     var rand = (Math.floor(Math.random() * 4));
     var correct = word[rand];
     
     $('#test p span').html(correct);
     $('input[name=rand]').click(function() {
        $('input[name=rand]').parent().removeClass('active1');
        $('input[name=rand]:checked').parent().addClass('active1');
     });
     $('#btn').click(function() {
         $('.popup-email').fadeOut('fast');
     });
     $('#contact-form').validate({
        errorElement: 'p',
        errorClass: 'notify',
        rules: {
            yourname: "required",
            yourmail: {
                required: true,
                email: true
            },
            message: "required"
        },
        messages: {
            yourname: "Please enter your name",
            email: {
                required: "Please enter your email",
                email: "Valid email is required"
            }
        },
        submitHandler: function(form) {
            var user = $('input[name=rand]:checked').val();
            if(user === correct) {
                $.ajax({
                    url: 'form_data.php',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                      yourname: $('#yourname').val(),
                      yourmail: $('#yourmail').val(),
                      message: $('#message').val()
                    },
                    success: function(response) {
                        if(response.status === true) {
                            $('.element p').remove();
                            $('.element').prepend('<p class="success">' + response.msg + '</p>');
                            $('.popup-email').fadeIn('fast');
                            $('#yourname').prop('value', '');
                            $('#yourmail').prop('value', '');
                            $('#message').prop('value', '');
                            $('input[name=rand]:checked').parent().removeClass('active1');
                            $('input[name=rand]:checked').prop('checked', false);
                        } else {
                            $('.element p').remove();
                            $('.element').prepend('<p class="error">' + response.msg + '</p>');
                            $('.popup-email').fadeIn('fast');
                        }
                    }
                });
            } else {
                $('.popup-email').fadeIn('fast');
                $('.element p').remove();
                $('.element').prepend('<p class="error">Incorrect number selected!</p>');
            }
        }
     }); 
  // MAP///////////////////////////////////////////////


   $('#contact').bind('inview', function(event, isInView, visiblePartX, visiblePartY) {
      if (isInView) {
         var styles = [ {} ];

          var styledMap = new google.maps.StyledMapType(styles,
            {name: "Styled Map"});

          var mapOptions = {
            zoom: 13,
            center: new google.maps.LatLng(5.012167, 8.3368475),
            scrollwheel: false,

            // disable mapType-top_right corner
            mapTypeControl: true,
            disableDefaultUI: false,

            mapTypeControlOptions: {
              mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map-canvas']
            }
          };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

            var marker1 = new google.maps.Marker({
                position: new google.maps.LatLng(5.012167, 8.3368475),
                map: map,
                icon: 'images/pin.png' // This path is the custom pin to be shown. Remove this line and the proceeding comma to use default pin
            });



        map.mapTypes.set('map-canvas', styledMap);
        map.setMapTypeId('map-canvas');    
        
      }
    });

});

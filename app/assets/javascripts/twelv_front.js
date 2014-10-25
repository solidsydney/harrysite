/**
* @file
* FRONT PAGE HELTPER FUNCTIONS
*
*/

(function ($) {
  Drupal.behaviors.twelv_front = {
    attach: function (context, settings) {
      var win  = $(window),
          body = $('body'),
          slider = $('#slider'),
          menu = $('#header'),
          logo = $('#logo'),
          tag = $('.ds-tag a'),
          pos = menu.offset(),
          t = 300,
          maxWidth = 306,
          minWidth = 117,
          maxHeight = 73,
          minHeight = 28;
      slider.find('.views-row').each(function(){
        $(this).once().replaceWith('<li>'+this.innerHTML+'</li>');
      });
      slider.once().cSlider({
        width: 952,
        height : 426,
        speed : 800,
        ease : 'easeInOutQuad',
        arrows: true,
        navigation: false,
        captions: true,
        timer : true,
        time : 7000
      });
      win.scroll(function(){
        var top = $(this).scrollTop();
        if (top > minWidth && menu.hasClass('default')) {
          menu.removeClass('default').addClass('fixed');
          tag.css({'opacity':'0', 'top':'88px'});
          logo.stop().animate({
            'opacity':0
          },t-200,function(){
            $(this).animate({
              'height':minHeight
            },t,function(){
              $(this).find('img').css({'width':minWidth,'height':minHeight});
              $(this).animate({
                'opacity':1
              },t);
              tag.animate({
                'opacity':1
              },t);
            });
          });
        } else if (top <= maxHeight && menu.hasClass('fixed')) {
          menu.removeClass('fixed').addClass('default');
          tag.css({'opacity':'0', 'top':'5px'});
          logo.stop().animate({
            'opacity':0
          },t-200,function(){
            $(this).animate({
              'height':maxHeight
            },t,function(){
              $(this).find('img').css({'width':maxWidth,'height':maxHeight});
              $(this).animate({
                'opacity':1
              },t);
              tag.animate({
                'opacity':1
              },t);
            });
          });
        }
      });
    }
  };
})(jQuery);

initTooltips = ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $(".collapse").collapse()

jQuery -> initTooltips()

$(document).on 'page:load', initTooltips

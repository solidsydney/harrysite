# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#post_publish_on').datepicker
    dateFormat: 'yy-mm-dd'


jQuery ->
  $('#issue_publish_on').datepicker
    dateFormat: 'yy-mm-dd'

$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'
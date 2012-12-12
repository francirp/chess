# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#new_game_button').on 'click', (e) ->
    e.preventDefault()
    $('#new_game_form').slideToggle()

  $('#cancel_new_game').on 'click', (e) ->
    e.preventDefault()
    $('#new_game_form').slideToggle()

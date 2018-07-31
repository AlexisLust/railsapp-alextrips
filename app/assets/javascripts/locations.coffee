# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'submit', '#search-form', (event) ->
    event.preventDefault()
    #s = $('#name_val').val()
    $.get("locations/search", {name: $('#name_val').val()}, (result) ->
      $('#location_search_results').html result
    )

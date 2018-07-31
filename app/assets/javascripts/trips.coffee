# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'submit', '#search-form', (event) ->
    event.preventDefault()
    #s = $('#name_val').val()
    $.get("trips/search", {name: $('#name_val').val()}, (result) ->
      $('#trip_search_results').html result
    )

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "click", ".fancy-select ul.options li", ->
  $value = $(this).attr "data-raw-value"
  valuesToSubmit = {category: $value}
  $.ajax
    url: '/get_cities_from_category'
    type: "GET"
    dataType: "json"
    data: valuesToSubmit
    beforeSend: ->
    success: (data) ->
      $select = $('.select-city select')
      $select.children().remove()
      options = data
      $.each options, (index, obj) ->
        $(".select-city select").append '<option value="'+obj.slug+'" name="type" >' + obj.name + "</option>"
      $select.trigger("update.fs")
    complete: ->
      $.ajax
        url: '/get_filters_from_category'
        type: "GET"
        data: valuesToSubmit
        beforeSend: ->
        success: (data) ->
          $filterWrap = $('ul.main-banner-filters')
          $filterWrap.children().remove()
          w = data
          filters = w.split(',')
          $.each filters, (index, name) ->
            $filterWrap.append '<li><div class="squared-checkbox"><input id="squared-zimovi-'+index+'-form" name="check" type="checkbox" value="None"><label class="ico" for="squared-zimovi-'+index+'-form"></label></div><label class="text" for="squared-zimovi-'+index+'-form">'+name+'</label></li>'
        complete: ->

$(document).ready ->
  fancySelect = $('.fancy-select')
  fancySelect.fancySelect()
  fancySelect.trigger('update')
  $(".select-category select").change ->
    alert $(this).val()

#  bx slider for one event header page
  $('ul.page-header-slides').bxSlider
#    mode: 'fade'
    controls: false
    auto: true
    pause: 6000
    pagerCustom: 'ul.event-banner-thumbnails'
    responsive: true
#  $('.form-button').click ->
#    alert "На етапі розробки!"
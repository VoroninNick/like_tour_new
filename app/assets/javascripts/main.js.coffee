# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# bind for main menu
#init = ()->
$(document).on "click", '.header-wrap .button-open-main-menu', ->
  $currentElement = $(this)
  parentElement = $currentElement.closest('.header-wrap')

  if $currentElement.hasClass('link-to-main-menu')
    if $('.link-to-contacts-menu').hasClass('active')
      $('.link-to-contacts-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    if $('.link-to-main-menu').hasClass('active')
      $('.link-to-main-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    else
      $('.link-to-main-menu').addClass('active')
      parentElement.addClass('expand')

    if $('#main-menu').hasClass('hide')
      $('#contacts-menu').addClass('hide')
      $('#main-menu').removeClass('hide')

  if $currentElement.hasClass('link-to-contacts-menu')
    if $('.link-to-main-menu').hasClass('active')
      $('.link-to-main-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    if $('.link-to-contacts-menu').hasClass('active')
      $('.link-to-contacts-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    else
      $('.link-to-contacts-menu').addClass('active')
      parentElement.addClass('expand')

    if $('#contacts-menu').hasClass('hide')
      $('#main-menu').addClass('hide')
      $('#contacts-menu').removeClass('hide')

#$(document).on('page:load', init)

countTourInCategory = ($this) ->
  $page = $this.closest('.page-wrap')
  $tours = $page.find('.one-event-wrap')
  alert $tours.size()

toggleFiltersClass = ($this) ->
  $filter = $this.closest('li')
  if $filter.hasClass('active')
    $filter.removeClass('active')
  else
    $filter.addClass('active')

$(document).ready ->
  $("a.fancybox").fancybox
    padding: 0
    width: '100%'
    closeBtn : false
    tpl:
      wrap: "<div id=\"popup-wrapper\" class=\"fancybox-wrap popup-wrap\" tabIndex=\"-1\"><div class=\"fancybox-skin\"><div class=\"fancybox-outer\"><div class=\"fancybox-inner\"></div></div></div></div>"
  $("a.close-form").click (e) ->
    e.preventDefault()
    $.fancybox.close()

#  $("#Container").mixItUp()
# get count items
#  $('ul.event-filters li label').click ->
#    $this =$(this)
#    toggleFiltersClass($this)
#    countTourInCategory($this)

  $('form.filters label').click ->
    alert 'test'
#  click on switcher language
  $('li.active_language').click ->
    $this = $(this)
    if $this.hasClass('expand')
      $this.removeClass('expand')
    else
      $this.addClass('expand')
# social links
  $('.share-links-wrap .icon').click ->
    $parent = $(this).closest('.inner')
    if $parent.hasClass('active')
      $parent.removeClass('active')
    else
      $parent.addClass('active')

#  focusout on switcher language
  $('ul.sub-menu-switcher').focusout ->
    $wrap = $(this).closest('.language-switcher-wrap')
    $obj = $wrap.find('li.active_language')
    if $obj.hasClass('expand')
      $obj.removeClass('expand')


#  index page region carousel
  owl1 = $("ul.owl-carousel")
  owl1.owlCarousel
    pagination: false,
    navigation: false,
#    navigationText: [
#      '<%= ApplicationHelper.embedded_svg_js "MO-arrow.svg", class: "owl_arrow_prev"%>',
#      '<%= ApplicationHelper.embedded_svg_js "MO-arrow.svg", class: "owl_arrow_next"%>'
#    ],
    items: 6 #10 items above 1000px browser width
    itemsDesktop: [ #5 items between 1000px and 901px
      1000
      3
    ]
    itemsDesktopSmall: [ # betweem 900px and 601px
      900
      2
    ]
    itemsTablet: [ #2 items between 600 and 0
      780
      2
    ]
    itemsMobile: false # itemsMobile disabled - inherit from itemsTablet option
    autoPlay : false


#  index page region carousel
  owl2 = $(".partners-wrap ul")
  owl2.owlCarousel
    pagination: false,
    navigation: false,
#    navigationText: [
#      '<%= ApplicationHelper.embedded_svg_js "MO-arrow.svg", class: "owl_arrow_prev"%>',
#      '<%= ApplicationHelper.embedded_svg_js "MO-arrow.svg", class: "owl_arrow_next"%>'
#    ],
    items: 5 #10 items above 1000px browser width
    itemsDesktop: [ #5 items between 1000px and 901px
      1000
      5
    ]
    itemsDesktopSmall: [ # betweem 900px and 601px
      900
      2
    ]
    itemsTablet: [ #2 items between 600 and 0
      780
      2
    ]
    itemsMobile: false # itemsMobile disabled - inherit from itemsTablet option
    autoPlay : false

#  tabs index
  $('.index-tour-tabs-wrap ul li').click ->
    current_position = $(this).index()
    $head_tabs = $(this).closest('.index-tour-tabs-wrap')
    $head_tabs_li = $head_tabs.find('li')
    $head_tabs_li.children().removeClass('active')
    $(this).children().first().addClass('active')
    $body_tabs_li = $('.index-tour-tabs-pages-wrap').find('.index-tour-page')
    $body_tabs_li.removeClass('active').addClass('hide')
    $body_tabs_li.eq(current_position).addClass('active').removeClass('hide')

# declare global
slider_array = new Array()
jQuery(document).ready ($) ->

  # launch bxslider
  a = {
    controls: true
    pause: 6000
#    auto: true
    pagerCustom: '#custom-thumbnails'
    responsive: true
  }

  b = {
    controls: false
    pause: 6000
#    auto: true
    pagerCustom: '#custom-thumbnails'
    responsive: true
  }

  $(".bxslider").each (i) ->
    if $(this).hasClass('first-main-banner')
      slider_array[i] = $(this).eq(0).bxSlider(a)
    else if $(this).hasClass('second-main-banner')
      slider_array[i] = $(this).eq(0).bxSlider(b)

  # bind controls on custom controls, and run functions on every slider
  $(".bx-controls-direction a").bind "click", (e) ->
    e.preventDefault()
    if $(this).hasClass("bx-prev")
      $.each slider_array, (i, elem) ->
        elem.goToPrevSlide()

    else if $(this).hasClass("bx-next")
      $.each slider_array, (i, elem) ->
        elem.goToNextSlide()

#index page filter
#$(document).on "click", 'ul.event-filters label', ->
#  $this = $(this)
#  currentEvent = $(this).text()
#  $parentElement = $(this).closest('.index-tour-page')
#  $childrenList = $parentElement.find('.one-event-wrap')
#  childrenDataWord = $childrenList.attr "data-filter-word"
#
#  arr = childrenDataWord.toLowerCase().split(",")
#
#  $items_to_hide = $childrenList.filter(->
#    arr = $(this).attr("data-filter-word").toLowerCase().split(",")
#    for item in arr
#      if item.indexOf(currentEvent.toLowerCase()) == 0
#
#        return true
#    return false
#  )
#  if $items_to_hide
#    alert $items_to_hide.attr "data-filter-word"
#    $childrenList.addClass('hide')
#    if $items_to_hide.hasClass('hide')
#      $items_to_hide.removeClass('hide')











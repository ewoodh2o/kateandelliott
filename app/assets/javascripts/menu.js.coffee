$ = jQuery

$.fn.extend
  menu: (options) ->
    self = $.fn.menu
    opts = $.extend {}, options
    $(this).each (i, el) ->
      self.init el, opts

$.extend $.fn.menu,

  init: (el, opts) ->
    self = el

    # Add ending element to catch
    $("#content section").append $('<div>').addClass("clear end")


    $('li.link', el).each ->

      # On element click, scroll page to position the top of
      # that element at the top of the page
      $(this).click ->
        top = $('#' + $(this).data('menuId')).offset().top
        $('html, body').animate
          scrollTop: top - 80
          600


      # When scrolling past a headline, highlight that
      # menu item
      $('#' + $(this).data('menuId') + ' h2').waypoint(
        (ev, direction) =>
          return unless direction == 'down'
          $('li.link', el).removeClass('current')
          $(this).addClass('current')
        offset: 250
      )
      $('#' + $(this).data('menuId') + ' div.end').waypoint(
        (ev, direction) =>
          return unless direction == 'up'
          $('li.link', el).removeClass('current')
          $(this).addClass('current')
        offset: '25%'
      )

    $('li.home', el).each ->
      $(this).click ->
        $('html, body').animate
          scrollTop: 0
          600

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
    $('li.link', el).each ->
      
      # On element click, scroll page to position the top of
      # that element at the top of the page
      $(this).click ->
        top = $('#' + $(this).data('menuId')).offset().top
        $('html, body').animate
          scrollTop: top - 80
          600

    $('li.home', el).each ->
      $(this).click ->
        $('html, body').animate
          scrollTop: 0
          600

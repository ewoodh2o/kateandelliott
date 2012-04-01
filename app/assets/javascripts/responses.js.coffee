# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $.fn.extend
    responseform: (options) ->
      self = $.fn.responseform
      $(this).each (i, el) ->
        self.init el

  $.extend $.fn.responseform,

    init: (el) ->
      # self = el
      ($ '#rsvp #response_attending_yes').click (event) ->
        # $('#response_guests').attr('disabled', null)
        $('#rsvp .radiorow').removeClass('selected')
        $(this).parents('.radiorow').addClass('selected')

      ($ '#rsvp #response_attending_no').click (event) ->
        # $('#response_guests').attr('disabled', 'disabled')
        $('#rsvp .radiorow').removeClass('selected')
        $(this).parents('.radiorow').addClass('selected')

      ($ '#rsvp .radiorow').click (event, ignore) ->
        ($ 'input[type=radio]', this).trigger('click', true) unless ignore

      ($ '#rsvp #response_guests').bind 'keyup', (event) ->
        $('#guests_text').text(
          (if $('#response_guests').val() == '1' then 'guest' else 'guests')
        )

      ($ '#rsvp input[type=radio]:checked').trigger('click')
      ($ '#rsvp #response_guests').trigger('keyup')

      ($ el).bind 'ajax:success', (ev, data, status, xhr) ->
        $(el).parents('#card').replaceWith(data)

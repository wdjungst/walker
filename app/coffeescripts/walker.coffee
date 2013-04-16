$ ->
  $('#pledge_form').bind 'submit', (e) ->
      e.preventDefault()
      $form = $(@)
      $submitButton = $form.find('button')
      $submitButton.html('Sending...')
      $submitButton.attr("disabled", "disabled").addClass("disabled")
      $.ajax
        type: 'POST',
        url: '/pledge',
        data: $form.serializeArray(),
        success: (data) ->
          $contentInfo = $("#pledge_info")
          $contentInfo.html(data).slideToggle()
          $('#pledge_form')[0].reset()
          $submitButton.html("Send")
          $submitButton.removeAttr("disabled").removeClass("disabled")
        error: (data) ->
          $submitButton.html("Send")
          $submitButton.removeAttr("disabled").removeClass("disabled")
          alert('email fail try again')

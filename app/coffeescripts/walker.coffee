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
          $contentInfo.hide() if $contentInfo.is(':visible')
          $contentInfo.html(data).slideToggle()
          $.get '/pledges', (data) ->
            $pledgeAmount = $('#pledge_amount')
            $pledgeAmount.text("Raised: $#{data}.00")
            $pledgeAmount.animate
              "font-size": "20px"
            , 400, "swing"
            $pledgeAmount.animate
              "font-size": "16px"
            , 1000, "swing"
          $('#pledge_form')[0].reset()
          $submitButton.html("Send")
          $submitButton.removeAttr("disabled").removeClass("disabled")
        error: (data) ->
          $submitButton.html("Send")
          $submitButton.removeAttr("disabled").removeClass("disabled")
          alert('email fail try again')

 resetButtonStates = (button) ->
   if $(button).hasClass("btn-primary")
     $(button).removeClass "btn-primary"
   else
     $(button).addClass "btn-primary"
  clearAll = ->
    $about_button.removeClass "btn-primary"
    $donate_button.removeClass "btn-primary"
    $comment_button.removeClass "btn-primary"
    $faq_button.removeClass "btn-primary"
    $("#about-content").addClass "hidden"  unless $("#about-content").hasClass("hidden")
    $("#donate-content").addClass "hidden"  unless $("#donate-content").hasClass("hidden")
    $("#comment-content").addClass "hidden"  unless $("#comment-content").hasClass("hidden")
    $("#faq-content").addClass "hidden"  unless $("#faq-content").hasClass("hidden")
  $about_button = $("#about_button")
  $donate_button = $("#donate_button")
  $comment_button = $("#comment_button")
  $faq_button = $("#faq_button")
  $about_content = $("#about-conent")
  $about_button.bind "click", ->
    clearAll()
    resetButtonStates this
    if $("#about-content").hasClass("hidden")
      $("#about-content").removeClass "hidden"
    else
      $("#about-content").addClass "hidden"

  $donate_button.bind "click", ->
    clearAll()
    resetButtonStates this
    if $("#donate-content").hasClass("hidden")
      $("#donate-content").removeClass "hidden"
    else
      $("#donate-content").addClass "hidden"

  $comment_button.bind "click", ->
    clearAll()
    resetButtonStates this
    if $("#comment-content").hasClass("hidden")
      $("#comment-content").removeClass "hidden"
    else
      $("#comment-content").addClass "hidden"

  $faq_button.bind "click", ->
    clearAll()
    resetButtonStates this
    if $("#faq-content").hasClass("hidden")
      $("#faq-content").removeClass "hidden"
    else
      $("#faq-content").addClass "hidden"


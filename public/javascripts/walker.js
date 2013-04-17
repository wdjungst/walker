// Generated by CoffeeScript 1.6.2
(function() {
  var $about_button, $about_content, $comment_button, $donate_button, $faq_button, clearAll, resetButtonStates;

  $(function() {
    return $('#pledge_form').bind('submit', function(e) {
      var $form, $submitButton;
      e.preventDefault();
      $form = $(this);
      $submitButton = $form.find('button');
      $submitButton.html('Sending...');
      $submitButton.attr("disabled", "disabled").addClass("disabled");
      return $.ajax({
        type: 'POST',
        url: '/pledge',
        data: $form.serializeArray(),
        success: function(data) {
          var $contentInfo;
          $contentInfo = $("#pledge_info");
          if ($contentInfo.is(':visible')) {
            $contentInfo.hide();
          }
          $contentInfo.html(data).slideToggle();
          $.get('/pledges', function(data) {
            var $pledgeAmount;
            $pledgeAmount = $('#pledge_amount');
            $pledgeAmount.text("Raised: $" + data + ".00");
            $pledgeAmount.animate({
              "font-size": "20px"
            }, 400, "swing");
            return $pledgeAmount.animate({
              "font-size": "16px"
            }, 1000, "swing");
          });
          $('#pledge_form')[0].reset();
          $submitButton.html("Send");
          return $submitButton.removeAttr("disabled").removeClass("disabled");
        },
        error: function(data) {
          $submitButton.html("Send");
          $submitButton.removeAttr("disabled").removeClass("disabled");
          return alert('email fail try again');
        }
      });
    });
  });

  resetButtonStates = function(button) {
    if ($(button).hasClass("btn-primary")) {
      return $(button).removeClass("btn-primary");
    } else {
      return $(button).addClass("btn-primary");
    }
  };

  clearAll = function() {
    $about_button.removeClass("btn-primary");
    $donate_button.removeClass("btn-primary");
    $comment_button.removeClass("btn-primary");
    $faq_button.removeClass("btn-primary");
    if (!$("#about-content").hasClass("hidden")) {
      $("#about-content").addClass("hidden");
    }
    if (!$("#donate-content").hasClass("hidden")) {
      $("#donate-content").addClass("hidden");
    }
    if (!$("#comment-content").hasClass("hidden")) {
      $("#comment-content").addClass("hidden");
    }
    if (!$("#faq-content").hasClass("hidden")) {
      return $("#faq-content").addClass("hidden");
    }
  };

  $about_button = $("#about_button");

  $donate_button = $("#donate_button");

  $comment_button = $("#comment_button");

  $faq_button = $("#faq_button");

  $about_content = $("#about-conent");

  $about_button.bind("click", function() {
    clearAll();
    resetButtonStates(this);
    if ($("#about-content").hasClass("hidden")) {
      return $("#about-content").removeClass("hidden");
    } else {
      return $("#about-content").addClass("hidden");
    }
  });

  $donate_button.bind("click", function() {
    clearAll();
    resetButtonStates(this);
    if ($("#donate-content").hasClass("hidden")) {
      return $("#donate-content").removeClass("hidden");
    } else {
      return $("#donate-content").addClass("hidden");
    }
  });

  $comment_button.bind("click", function() {
    clearAll();
    resetButtonStates(this);
    if ($("#comment-content").hasClass("hidden")) {
      return $("#comment-content").removeClass("hidden");
    } else {
      return $("#comment-content").addClass("hidden");
    }
  });

  $faq_button.bind("click", function() {
    clearAll();
    resetButtonStates(this);
    if ($("#faq-content").hasClass("hidden")) {
      return $("#faq-content").removeClass("hidden");
    } else {
      return $("#faq-content").addClass("hidden");
    }
  });

}).call(this);

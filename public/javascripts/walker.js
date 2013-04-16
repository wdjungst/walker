$about_button = $('#about_button');
$donate_button = $('#donate_button');
$comment_button = $('#comment_button');
$faq_button = $('#faq_button');
$about_content = $('#about-conent');

function resetButtonStates(button) {
  if ($(button).hasClass('btn-primary'))
    $(button).removeClass('btn-primary');
  else
    $(button).addClass('btn-primary');
}

function clearAll() {
  $about_button.removeClass('btn-primary');
  $donate_button.removeClass('btn-primary');
  $comment_button.removeClass('btn-primary');
  $faq_button.removeClass('btn-primary');

  if (!$('#about-content').hasClass('hidden'))
    $('#about-content').addClass('hidden');
  if (!$('#donate-content').hasClass('hidden'))
    $('#donate-content').addClass('hidden');
  if (!$('#comment-content').hasClass('hidden'))
    $('#comment-content').addClass('hidden');
  if (!$('#faq-content').hasClass('hidden'))
    $('#faq-content').addClass('hidden');
}

$about_button.bind('click', function() {
  clearAll();
  resetButtonStates(this);
  if ($('#about-content').hasClass('hidden'))
    $('#about-content').removeClass('hidden');
  else
    $('#about-content').addClass('hidden');
});


$donate_button.bind('click', function() {
  clearAll();
  resetButtonStates(this);
  if ($('#donate-content').hasClass('hidden'))
    $('#donate-content').removeClass('hidden');
  else
    $('#donate-content').addClass('hidden');
});


$comment_button.bind('click', function() {
  clearAll();
  resetButtonStates(this);
  if ($('#comment-content').hasClass('hidden'))
    $('#comment-content').removeClass('hidden');
  else
    $('#comment-content').addClass('hidden');
});


$faq_button.bind('click', function() {
  clearAll();
  resetButtonStates(this);
  if ($('#faq-content').hasClass('hidden'))
    $('#faq-content').removeClass('hidden');
  else
    $('#faq-content').addClass('hidden');
});

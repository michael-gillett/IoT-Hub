$(() ->
  # Expand/ Collapse the device drawer
  $('.info-row').click ->
    $(this).siblings('.drawer').slideToggle(250, 'linear');
    $(this).find('.arrow').toggleClass('icon-down-open icon-up-close')

  # Switch toggler
  $('.switch').change ->
    console.log('change')

  $('.range-slider').change ->
    percent = $(this).val()
)
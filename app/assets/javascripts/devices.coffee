$(() ->
  # Expand/ Collapse the device drawer
  $('.info-row').click ->
    $(this).siblings('.drawer').toggle();
    $(this).find('.arrow').toggleClass('icon-down-open icon-up-close')

  # Switch toggler
  $('.switch').change () ->
    device = $(this).closest('.device')
    id = device.data('id')

    checked = $(this).find('input').is(':checked')
    exec = if checked then "turn_on" else "turn_off"
    change_state(id, exec)

  $('.range-slider').change ->
    device = $(this).closest('.device')
    id = device.data('id')
    percent = $(this).val()
    # {id:"1", event:"adjust", value:"250"}
    change_state(id, "adjust", percent)

  $('.btn-success').click ->
    color = 'green'
    device = $(this).closest('.device')
    id = device.data('id')
    exec = 'adjust'
    change_state(id, 'adjust', color)

  $('.btn-danger').click ->
    color = 'red'
    device = $(this).closest('.device')
    id = device.data('id')
    exec = 'adjust'
    change_state(id, 'adjust', color)

  $('.btn-info').click ->
    color = 'blue'
    device = $(this).closest('.device')
    id = device.data('id')
    exec = 'adjust'
    change_state(id, 'adjust', color)



  change_state = (id, exec, value) ->
    data = {"id": id, "event": exec}
    if exec == 'adjust'
      data['value'] = value

    $.post('/device', data)
)
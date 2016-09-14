ready = ->
  $('body').on 'change', '.status-order', ->
    url = $(this).val()
    $.put url
    return

  $.put = (url, data, callback, type) ->
    if $.isFunction(data)
      type = type or callback
      callback = data
      data = {}
    $.ajax
      url: url
      type: 'PUT'
      success: callback
      data: data
      contentType: type

$(document).ready(ready)
$(document).on('page:load', ready)

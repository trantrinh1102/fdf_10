$(document).ready ->
  $('body').on 'click', '.btn-delete-product-suggest', ->
    $product = $(this).closest('tr')
    if confirm('Are you sure ?')
      $.ajax
        type: 'DELETE'
        url: '/admin/product_suggests/' + $(this).data('value')
        dataType: 'json'
        success: (data) ->
          $product.remove()
          $('.flash-massage').replaceWith('<div class="alert alert-success %>">'+data.flash[0][1]+'</div>')
          return
        error: (error_message) ->
          alert 'error' + error_message
          return

ready = ->
  $('body').on 'change', '.status-product-sugges', ->
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

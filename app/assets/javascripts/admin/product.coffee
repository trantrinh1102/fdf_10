$(document).ready ->
  $('body').on 'click', '.btn-delete-product', ->
    $product = $(this).closest('tr')
    if confirm('Are you sure ?')
      $.ajax
        type: 'DELETE'
        url: '/admin/products/' + $(this).data('value')
        dataType: 'json'
        success: (data) ->
          $product.remove()
          $('.flash-massage').replaceWith('<div class="alert alert-success %>">'+data.flash[0][1]+'</div>')
          return
        error: (error_message) ->
          alert 'error' + error_message
          return

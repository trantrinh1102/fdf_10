$(document).ready ->
  $('body').on 'click', '.btn-user-delete-product-suggest', ->
    $product = $(this).closest('tr')
    if confirm('Are you sure ?')
      $.ajax
        type: 'DELETE'
        url: '/product_suggests/' + $(this).data('value')
        dataType: 'json'
        success: (data) ->
          $product.remove()
          $('.flash-massage').replaceWith('<div class="alert alert-success %>">'+data.flash[0][1]+'</div>')
          return
        error: (error_message) ->
          alert 'error' + error_message
          return

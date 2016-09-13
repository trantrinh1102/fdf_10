$(document).ready ->
  $('body').on 'click', '.btn-delete-comment', ->
    $comment = $(this).closest('.comment')
    if confirm('Are you sure ?')
      $.ajax
        type: 'DELETE'
        url: '/comments/' + $(this).data('value')
        dataType: 'json'
        success: (data) ->
          $comment.remove()
          $('.flash-massage').replaceWith('<div class="alert alert-success %>">'+data.flash[0][1]+'</div>')
          return
        error: (error_message) ->
          alert 'error' + error_message
          return

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


   $('body').on 'click', '.btn-post-comment', ->
      valproductid = $('#product_id').val()
      valuserid = $('#user_id').val()
      valcontent = $('#content').val()
      console.log(valcontent)
      $.ajax
        type: 'POST'
        url: '/comments/'
        dataType: 'json'
        data: {
        comment: {
             content: valcontent,
             user_id: valuserid,
             product_id: valproductid
             }
            }
        success: (data) ->

          return
        error: (error_message) ->
          alert 'error' + error_message
          return

<div class="comment">
  <div class="row">
    <div class="col-md-3 image-user">
      <%= image_tag comment.user.avatar.thumb.url %>
    </div>
    <div class="col-md-9 comment-content">
      <div class="row">
        <span class="content truncate">
          <%= comment.content %>
        </span>
      </div>
      <div class="row">
        <span class="timestamp"><%= t "comment.posted" %>
          <span class="user"><%= link_to comment.user.name, "#" %></span>
          <%="#{t("comment.about")} #{time_ago_in_words(comment.created_at)}
            #{t("comment.ago")}"%>
          <% if current_user.is_user? comment.user %>
            <a class="btn-delete-comment" data-value="<%= comment.id %>">
            <i class="text-danger glyphicon glyphicon-trash"></i></a>
          <% end %>
        </span>
      </div>
    </div>
  </div>
</div>


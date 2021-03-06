$(document).ready( ->
  addCommentClickEvents()
)
@addCommentClickEvents = ->
  console.log 'adding comment click events'
  $('.reply-to').click( ->
    parentCommentId = $(this).attr('id').match(/reply-to-([0-9]+)/)[1]
    $('#comment_form #parent_comment_id').val(parentCommentId)

    parentCommentHTML = $('#comment-' + parentCommentId + ' .comment-body').html()
    $('#comment_form-reply_to-body').html(parentCommentHTML)

    parent = $('#comment' + parentCommentHTML)
    replyingTo = parent.find('.comment-author').html()
    $('#comment_form-reply_to-heading').html('Replying to: ' + replyingTo)
    $('#comment_form-reply_to').show()
  )

  $('.delete-comment').click( ->
    #commentToDeleteId = $(this).attr('id').match(/delete-comment-([0-9]+))[1]
  )

  $('#cancel-reply-to').click( (e) ->
    console.log 'cancelling reply'
    $('#comment_form #parent_comment_id').val('')
    $('#comment_form-reply_to').hide()
  )

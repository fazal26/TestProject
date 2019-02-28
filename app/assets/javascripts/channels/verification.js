App.chat = App.cable.subscriptions.create("VerificationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var comments;
    if (data['parent_id']){      
      var path = "#comment-"+ data.parent_id;
      comments = $(path);
    }else{
      comments = $('#verificationCommentBox');
    }
    comments.append(data['comment']);
    comments.scrollTop(comments[0].scrollHeight);
  }
});
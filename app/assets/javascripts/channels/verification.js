App.chat = App.cable.subscriptions.create("VerificationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var comments = $('#verificationCommentBox');
    comments.append(data['comment']);
    // comments.scrollTop(comments[0].scrollHeight);
    }
  });
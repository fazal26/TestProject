App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var comments = $('#commentBox');
    comments.append(data['comment']);
    // comments.scrollTop(comments[0].scrollHeight);
  }
});
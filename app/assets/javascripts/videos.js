var user_id = document.getElementById("slug").getAttribute("class");
App.room = App.cable.subscriptions.create({
  channel: "WebNotificationsChannel",
  user_id: user_id
}, {
  connected: function() {
    console.log('connected');
  },
  received: function(data) {
    location.reload();
  }
});
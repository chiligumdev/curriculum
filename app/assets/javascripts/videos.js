var video_slug = document.getElementById("slug").getAttribute("class");
App.room = App.cable.subscriptions.create({
    channel: "WebNotificationsChannel",
    video_slug: video_slug
  }, {
    connected: function() {
    console.log('connected');
  },
    received: function(data) {
   	alert('hiii'); 
  }
});
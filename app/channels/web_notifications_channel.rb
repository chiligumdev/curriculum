# Webscoket to excel validation
class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "web_notifications_channel_#{params[:user_id]}"
  end

  def unsubscribed; end
end

class PostbacksController < ApplicationController
  protect_from_forgery
  
  # Disable Cors
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers
  skip_before_action :verify_authenticity_token

  def create
    video = Video.find_by_api_id(params['id'].to_i)
    video.update(url: params['url'], thumbnail_url: params['thumbnail_url'])
    ActionCable.server.broadcast "web_notifications_channel_#{video.user_id}", data: { error: 'false' }
  end

  private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def cors_preflight_check
    return unless request.method == 'OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    headers['Access-Control-Max-Age'] = '1728000'
    render text: '', content_type: 'text/plain'
  end
end

require 'down'
require 'rest-client'

# Main api consume
class API
  include HTTParty
  base_uri 'api.chiligumvideos.com/api'

  def initialize
    @headers = { token: ENV['CHILIGUM_TOKEN'] }
  end

  def templates(id = nil)
    response =
      if id.nil?
        self.class.get('/templates', headers: @headers)
      else
        self.class.get("/templates/#{id}", headers: @headers)
      end
    JSON.parse response.body
  end

  def tracks(id = nil)
    response =
      if id.nil?
        self.class.get('/tracks', headers: @headers)
      else
        self.class.get("/tracks/#{id}", headers: @headers)
      end
    JSON.parse response.body
  end

  def assets(file)
    tempfile = Down.download(file[:file])

    params = {
      asset: {
        name: 'foto_perfil',
        attachment: File.new(tempfile)
      }
    }

    response = RestClient.post('https://api.chiligumvideos.com/api/assets', params, @headers)

    JSON.parse response.body
  end
  
  def videos(data)
    response = HTTMultiParty.post("https://api.chiligumvideos.com/api/videos", :query => {
      video: { 
        name: 'Video CV',
        resolution: 1080,
        track_id: 95,
        template_id: 168,
        data: data,
        postback_url: 'http://466d7517.ngrok.io/postback'
      }}, headers: @headers, timeout: 120)
    JSON.parse response.body
  end
end

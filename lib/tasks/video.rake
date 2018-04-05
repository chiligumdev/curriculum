namespace :video do
  task process: :environment do
    loop do
      videos = Video.where(api_id: nil, url: nil)

      videos.each do |video|

        user = video.user
        data = { foto: '', nome: "#{user.first_name} #{user.last_name}",  idade: '', profissao: user.headline, 
                 cargo: user.job_position, nome_empresa: user.company, ano: '', curso: user.course, 
                 escola: user.university, contato: user.profile_url, contato_2: user.email
        } 

        response = API.new.videos(video.id, data, '', '151')
        video.update(api_id: response['id'] )
      end
      puts "rodou"
      # ActionCable.server.broadcast "web_notifications_channel_7", data: { error: 'false' }
      sleep 10
    end
  end
end

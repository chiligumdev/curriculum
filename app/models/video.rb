class Video < ApplicationRecord
  belongs_to :user
  # after_commit :send_video, on: :create

  def send_video
    api = API.new
    foto_01 = api.assets(file: self.user.picture_url)
    user = self.user
    api.videos(foto_01: foto_01, logo_01: 'https://s3.amazonaws.com/apiteaser/assets/cvv1231232123.png',
               nome_01: "#{user.first_name} #{user.last_name}", cargo_01: user.headline, curso_01: user.course, 
               idade_01: "#{user.age} anos", cidade_01: user.location, contato_01: user.email, contato_02: '', empresa_01: '', profissao_01: '', instituicao_01: '' )
  end

end

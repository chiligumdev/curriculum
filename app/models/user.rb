class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider_token = auth.credentials.token
      raw_info = auth.extra.raw_info
      user.email = raw_info['emailAddress']
      user.first_name = raw_info['firstName']
      user.last_name = raw_info['lastName']
      user.location = raw_info['location']['name']
      user.picture_url = raw_info['pictureUrl']
      user.profile_url = raw_info['publicProfileUrl']
      user.password = Devise.friendly_token[0, 20]
    end
  end
end

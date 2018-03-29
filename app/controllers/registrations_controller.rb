class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    puts 'eee'
  end

  def update
    puts "hellou"
  end
end

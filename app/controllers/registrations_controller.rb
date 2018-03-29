class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    puts 'eee'
  end

  def update
  	current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :picture_url, :profile_url, :headline, :age, :company, :job_position, :university, :course)
  end
end

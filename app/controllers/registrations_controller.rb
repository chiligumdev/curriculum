class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    video = Video.find_by_user_id(current_user.id)
    redirect_to video_path(video.slug) unless video.nil?
  end

  def update
    current_user.update(user_params)
    video = Video.create(user_id: current_user.id, slug: current_user.slug)
    redirect_to video_path(video.slug)  
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :picture_url, :profile_url, :headline, :age, :company, :job_position, :university, :course, :email)
  end
end

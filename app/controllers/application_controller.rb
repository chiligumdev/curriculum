class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(_resource_or_scope)
    session[:previous_url] || edit_user_registration_path
  end
end

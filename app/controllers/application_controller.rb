class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    update_attrs = [:username, :email, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  end
  
  def after_sign_in_path_for(resource)
    wikis_path
  end
  
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(:first_name, :last_name, :username, :email, :password,
                  :password_confirmation, :remember_me, :group_id)
    end
    devise_parameter_sanitizer.for(:sign_in) do |user|
      user.permit(:login, :username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(:first_name, :last_name, :username, :email, :password,
                  :password_confirmation, :current_password, :group_id)
    end
  end
end

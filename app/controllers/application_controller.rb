class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(:first_name, :last_name, :username, :email, :password,
                  :password_confirmation, :remember_me)
    end
    devise_parameter_sanitizer.for(:sign_in) do |user|
      user.permit(:login, :username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(:first_name, :last_name, :username, :email, :password,
                  :password_confirmation, :current_password)
    end
  end

  def layout_by_resource
    if devise_controller?
      "devise.html.erb"
    else
      "application.html.erb"
    end
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end

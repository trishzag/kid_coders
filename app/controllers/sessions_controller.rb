class SessionsController < Devise::RegistrationsController
  before_filter :configure_sign_in_params, only: [:create, :new]

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :username
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end

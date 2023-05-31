class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def redirect_if_signed_in
    redirect_to root_path, notice: 'すでにログインしています' if user_signed_in?
  end
end

class RegistrationsController < Devise::RegistrationsController
  before_action :redirect_if_signed_in, only: [:new, :create]
end

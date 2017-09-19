class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :update_sanitized_params, if: :devise_controller?


  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city_id, :email, :password, :password_confirmation])
  end
end

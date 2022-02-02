class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  respond_to :html, :json, :js

  before_action :configure_permited_parameters, if: :devise_controller?

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  # def configure_permited_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  # end
end

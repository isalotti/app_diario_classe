class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :configure_permited_parameters, if: :devise_controller?

  protected
  def configure_permited_parameters
    added_attrs = [:matricula , :email, :nome, :tipo, :password, :password_confirmation , :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end

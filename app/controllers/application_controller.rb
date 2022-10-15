require "application_responder"

class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  self.responder = ApplicationResponder
  respond_to :html

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confrimation, :current_password])
  end
end

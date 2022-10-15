require "application_responder"

class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent

  before_action :authenticate_user!

  self.responder = ApplicationResponder
  respond_to :html
end

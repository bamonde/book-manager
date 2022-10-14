require "application_responder"

class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent

  self.responder = ApplicationResponder
  respond_to :html
end

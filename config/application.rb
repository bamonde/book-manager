require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller
    # config.responders.flash_keys = [ :notice, :alert ]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.time_zone = 'Brasilia'
    config.i18n.locale = :'pt-BR'
    config.i18n.default_locale = :'pt-BR'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.to_prepare do
      Devise::SessionsController.layout "public"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "public" }
      Devise::ConfirmationsController.layout "public"
      Devise::UnlocksController.layout "public"
      Devise::PasswordsController.layout "public"
    end
  end
end

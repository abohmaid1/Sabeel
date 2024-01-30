require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SabeelV01
  class Application < Rails::Application
    config.load_defaults 7.0
    config.exceptions_app = self.routes
  end
end

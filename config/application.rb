require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crumbl
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

#added so Heroku can use staging credentials to deploy the staging app
module Crumbl
  class Application < Rails::Application
    …
    if ENV["PIPE_ENV"].present?
      Rails.application.config.credentials.content_path = Rails.root.join("config/credentials/#{ENV["PIPE_ENV"]}.yml.enc")
    end
  end
end
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HelpOutApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # config.action_dispatch.default_headers = {
    #   'Access-Control-Allow-Origin' => 'https://help-out-oc-p8.herokuapp.com/',
    #   'Access-Control-Request-Method' => %w{GET POST PATCH OPTIONS}.join(",")
    # }

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins 'https://help-out-oc-p8.herokuapp.com/'
    #     resource '*', headers: :any, methods: [:get, :post, :patch, :delete, :options]
    #   end
    # end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

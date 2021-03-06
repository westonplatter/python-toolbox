require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

require 'open-uri'
require 'uri'

module PythonToolbox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators.system_tests = nil

    config.generators do |g|
      g.test_framework :rspec,
        :fixtures         => false,
        :view_specs       => false,
        :helper_specs     => true,
        :routing_specs    => false,
        :controller_specs => false,
        :request_specs    => true

      g.fixture_replacement :factory_girl,
        :dir => "spec/factories"
    end
  end
end

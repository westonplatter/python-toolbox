# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'
require 'database_cleaner'

require 'pry' if ENV['CI'].nil?

#
# surpress the FactoryGirl causes warnings
#
ActiveSupport::Deprecation.behavior = lambda do |msg, stack|
  unless /change/ =~ msg
    ActiveSupport::Deprecation::DEFAULT_BEHAVIORS[:stderr].call(msg,stack) # whichever handlers you want - this is the default
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :poltergeist do |app|
  # ignore errors becuase react libs send out deprecation warnings
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FeatureHelpers, type: :feature
  config.include Warden::Test::Helpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # Configure DatabaseCleaner to use truncation strategy with
  # JavaScript (js: true) specs.
  #
  # We want to ensure we're not using transactions as the work they do is
  # isolated to one database connection. One database connection is used by
  # the specs, and another, separate database connection is
  # used by the app server phantomjs interacts with. Truncation, when *not*
  # inside a transaction, affects all database connections, so truncation is
  # what we need!
  # http://www.railsonmaui.com/tips/rails/capybara-phantomjs-poltergeist-rspec-rails-tips.html
  # http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

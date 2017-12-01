require 'sidekiq'

require "sidekiq/throttled"
Sidekiq::Throttled.setup!

Sidekiq::Extensions.enable_delay!

Sidekiq.configure_client do |config|
  # sidekiq_calculations = SidekiqCalculations.new
  # sidekiq_calculations.raise_error_for_env!

  config.redis = { :namespace => 'python-toolbox', :url => 'redis://127.0.0.1:6379/1' }
end

Sidekiq.configure_server do |config|
  # sidekiq_calculations = SidekiqCalculations.new
  # sidekiq_calculations.raise_error_for_env!

  # config.options[:concurrency] = sidekiq_calculations.server_concurrency_size
  config.redis = { :namespace => 'python-toolbox', :url => 'redis://127.0.0.1:6379/1' }
end

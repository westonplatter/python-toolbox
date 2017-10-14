source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

gem 'aasm'
gem 'annotate'
gem 'awesome_print', require: true
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'bootstrap-will_paginate'
# gem 'carrierwave'
# gem 'city-state'
# gem 'countries'
gem 'devise'
gem 'figaro'
# gem 'fog-aws'
gem 'font-awesome-rails'
gem 'foreman'
# gem 'fuzzy_match'
gem 'github_api'
# gem 'headless'
gem 'jquery-rails'
# gem 'nested_form_fields'
# gem 'newrelic_rpm'
# gem 'paper_trail'
gem 'pg'
gem 'puma'
gem 'pundit'
# gem 'oj'
# gem 'rabl'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'react_on_rails'
gem 'rolify'
gem 'rollbar'
# gem 'rubocop', require: false
# gem 'select2-rails'
gem 'sidekiq'
gem 'sidekiq-throttled'
gem 'sidekiq-cron'
gem 'simple_form'
gem 'tether-rails'
# gem 'turbolinks'
# gem 'two_captcha'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# ai / bot / slack
# gem 'slack-ruby-bot'
# gem 'slack-ruby-client'
# gem 'celluloid-io', require: ['celluloid/current', 'celluloid/io']

# gem 'npm_api'

group :development, :test do
  # gem 'binding_of_caller'
  # gem 'byebug', platforms: %i[mingw mswin x64_mingw]

  gem 'capistrano', '3.3.5'
  gem 'capistrano-bundler'
  gem 'capistrano-figaro-yml'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-sidekiq'
  gem 'capistrano3-puma'

  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'poltergeist'
  # gem 'selenium-webdriver', require: false
end

group :development do
  gem 'better_errors'
  gem 'bullet'
  gem 'capistrano-rails-console', :require => false

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  # gem 'hub', :require => nil
  gem 'listen', '>= 3.0.5', '< 3.2'
  # gem 'rails_apps_pages'
  # gem 'rails_apps_testing'
  # gem 'rails_layout'
  # gem 'rb-fchange', :require => false
  # gem 'rb-fsevent', :require => false
  # gem 'rb-inotify', :require => false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  # gem 'launchy'
end

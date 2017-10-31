source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

gem 'aasm'
gem 'annotate'
gem 'awesome_print', require: true
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap-will_paginate'
gem 'bootswatch-rails'
gem 'devise'
gem 'figaro'
gem 'font-awesome-rails'
gem 'foreman'
gem 'github_api'
gem 'jquery-rails'
gem 'pg'
gem 'puma'
gem 'pundit'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'react_on_rails'
gem 'rolify'
gem 'rollbar'
gem 'sass-rails', '>= 3.2'
gem 'sidekiq'
gem 'sidekiq-throttled'
gem 'sidekiq-cron'
gem 'simple_form'
gem 'tether-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.0'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# ai / bot / slack
# gem 'slack-ruby-bot'
# gem 'slack-ruby-client'
# gem 'celluloid-io', require: ['celluloid/current', 'celluloid/io']

# gem 'npm_api'

group :development, :test do
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
end

group :development do
  gem 'better_errors'
  gem 'bullet'
  gem 'capistrano-rails-console', :require => false

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
end

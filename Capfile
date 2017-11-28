require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/figaro_yml'
require 'capistrano/puma'
require 'capistrano/rails/assets'
require 'capistrano/rails/console'
require 'capistrano/rails/migrations'
require 'capistrano/rbenv'
require 'capistrano/sidekiq'
require 'rollbar/capistrano3'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

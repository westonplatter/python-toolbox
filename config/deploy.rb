# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'python-toolbox'
set :repo_url, 'git@github.com:westonplatter/python-toobox.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml',
  'config/application.yml'
)

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  'public/system',
)

#
# setup rbenv
#
set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails sidekiq sidekiqctl}


#
# puma
#
set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_control_app, false
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
set :puma_daemonize, false
set :puma_plugins, []  #accept array of plugins
set :puma_tag, fetch(:application)

#
# sidekiq
#
set :sidekiq_default_hooks, true
set :sidekiq_pid, File.join(shared_path, 'tmp', 'pids', 'sidekiq.pid') # ensure this path exists in production before deploying.
set :sidekiq_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :sidekiq_log, File.join(shared_path, 'log', 'sidekiq.log')
set :sidekiq_options, nil
set :sidekiq_require, nil
set :sidekiq_tag, nil
set :sidekiq_config, File.join(current_path, 'config', 'sidekiq.yml')
set :sidekiq_queue, nil
set :sidekiq_timeout, 10
set :sidekiq_role, :app
set :sidekiq_processes, 1
set :sidekiq_options_per_process, nil
set :sidekiq_concurrency, nil
# set :sidekiq_monit_templates_path => 'config/deploy/templates'
# set :sidekiq_monit_conf_dir => '/etc/monit/conf.d'
# set :sidekiq_monit_use_sudo => true
# set :monit_bin => '/usr/bin/monit'
# set :sidekiq_monit_default_hooks => true
set :sidekiq_service_name, "sidekiq_#{fetch(:application)}_#{fetch(:sidekiq_env)}"
set :sidekiq_cmd, "#{fetch(:bundle_cmd, "bundle")} exec sidekiq" # Only for capistrano2.5
set :sidekiqctl_cmd, "#{fetch(:bundle_cmd, "bundle")} exec sidekiqctl" # Only for capistrano2.5
set :sidekiq_user, 'ubuntu' #user to run sidekiq as

# Default value for keep_releases is 5
# set :keep_releases, 5

#
# rollbar
#
set :rollbar_token, '29965c449b57479fa46e47fbebca8883'
set :rollbar_env, Proc.new { fetch :stage }
set :rollbar_role, Proc.new { :app }

# namespace :deploy do
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
# end

namespace :react_on_rails_assets do
  desc "npm install"
  task "install" do
    on roles(:app) do
      execute "cd #{release_path} && npm install"
    end
  end
end
after "bundler:install", "react_on_rails_assets:install"

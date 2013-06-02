set :rails_env, "production"
set :unicorn_env, "production"
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :branch, "develop"
set :user, 'user'
set :keep_releases, 5

role :web, '62.76.178.9'
role :app, '62.76.178.9'
role :db,  '62.76.178.9', :primary => true

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"
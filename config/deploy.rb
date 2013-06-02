# encoding: utf-8

set :application, "masterit"
set :stages, %w(production staging)
set :default_stage, "staging"

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p429@default'
set :rvm_path, '/usr/local/rvm/'

set :use_sudo, false
set :deploy_via, :export
set :ssh_options, :forward_agent => true

set :scm, :git
set :repository,  "git@github.com:PanfilovDenis/masterit.git"

default_run_options[:pty] = true

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Seed database data"
  task :seed_data do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db'
after 'deploy:update_code', 'deploy:assets:precompile'
after 'deploy:symlink_db', 'deploy:symlink_backup'
after 'deploy:symlink_backup', 'deploy:symlink_credentials'
after "deploy:update", "deploy:cleanup"
after "deploy:restart", "unicorn:stop"
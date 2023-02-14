# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "rails-project-64"
set :repo_url, "git@github.com:vlasikhin/#{fetch(:application)}.git"
set :branch, "main"
set :deploy_to, "/home/deploy/#{fetch(:application)}"
set :deploy_user, 'deploy'
set :rails_env, "production"
set :migration_role, :app
set :linked_dirs, %w{log/web tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :rbenv_type, :user
set :rbenv_ruby, "3.2.0"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/master.key", "config/credentials.yml.enc")

namespace :deploy do
  desc "Start application"
  task :start do
    on roles(:app, :web) do
      execute "sv start ~/service/web"
    end
  end

  desc "Stop application"
  task :stop do
    on roles(:app, :web) do
      execute "sv stop ~/service/web"
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app, :web) do
      execute "sv restart ~/service/web"
    end
  end

  desc "reload the database with seed data"
  task :seed do
    on roles(:app) do
      execute "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{fetch(:rails_env)}"
    end
  end

  after :publishing, :restart
end

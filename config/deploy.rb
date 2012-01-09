# RVM Integration
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

# App Configuration
set :scm, :git
set :application, "kateandelliott"
set :repository,  "git@github.com:ewoodh2o/kateandelliott.git"
set :user, "kateandelliott"
set :deploy_to, "/home/kateandelliott/app"
set :deploy_via, :remote_cache
set :normalize_asset_timestamps, false
set :use_sudo, false

role :web, "snapper.two-fish.com"
role :app, "snapper.two-fish.com"
role :db,  "snapper.two-fish.com", :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do
    run "cd #{current_release} && RAILS_ENV=production passenger start -a 127.0.0.1 -p 3010 -d"
  end
  task :stop do
    run "cd #{current_release} && passenger stop -p 3010"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Install the bundle as necessary"
  task :bundle, :roles => :app do
    run "cd #{current_release} && bundle install"
  end
end

after "deploy:update_code", 'deploy:bundle'
after "deploy", "deploy:cleanup"



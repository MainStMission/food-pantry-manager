require "rvm/capistrano"
require "bundler/capistrano"
load "config/recipes/unicorn"
load "config/recipes/monit"
#load "config/recipes/nginx"
set :application, "pantry"
set :repository,  "git@github.com:MainStMission/food-pantry-manager.git"
set :user, 'msmuser'
set :ssh_options, {:forward_agent => true}
set :use_sudo, false
set :rvm_type, :user
default_run_options[:pty] = true
set :scm, :git

set :deploy_to, "/var/www/pantry"
set :branch, "azure-deployment"
set :deploy_via, :remote_cache
set :use_sudo, false

server "40.117.131.90", :web, :app, :db, :primary => true
#set :port, 25000
ssh_options[:forward_agent] = true

role :web,    "40.117.131.90"
role :app,    "40.117.131.90"
role :db,     "40.117.131.90", :primary => true


# after 'deploy:update_code', 'deploy:symlink_db'
# after 'deploy:symlink_db', 'deploy:create_db'
# after 'deploy:create_db', 'deploy:migrate_db'
# #load 'deploy/assets'

# namespace :deploy do
#   desc "create database"
# task :create_db, :roles => :db do
#     run "cd #{release_path}  && bundle exec rake RAILS_ENV=production  db:create"
# end
# end

namespace :deploy do
  desc "migrate database"
task :migrate_db, :roles => :db do
    run "cd #{release_path}  && bundle exec rake RAILS_ENV=production  db:migrate"
end
end


after "deploy", "deploy:cleanup"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    #sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    #unless `git rev-parse HEAD` == `git rev-parse origin/master`
    #  puts "WARNING: HEAD is not the same as origin/master"
    #  puts "Run `git push` to sync changes."
    #  exit
    #end
  end
  before "deploy", "deploy:check_revision"
end

# desc "Zero-downtime restart of Unicorn"
# task :restart, :except => { :no_release => true } do
#   run "kill -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
# end

# desc "Start unicorn"
# task :start, :except => { :no_release => true } do
#   run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E production"
# end

# desc "Stop unicorn"
# task :stop, :except => { :no_release => true } do
#   run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
# end
# after :deploy, "deploy:stop"
# after :deploy, "deploy:start"

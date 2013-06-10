require "rvm/capistrano"
require "bundler/capistrano"
set :application, "pantry"
set :repository,  "git@github.com:tbrooke/food-pantry-manager.git"
set :user, 'deployer'
set :ssh_options, {:forward_agent => true}
set :use_sudo, false
set :rvm_type, :user
default_run_options[:pty] = true
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git

set :deploy_to, "/var/www/pantry"
set :branch, "master"
set :deploy_via, :remote_cache
set :use_sudo, false

server "192.168.1.30", :web, :app, :db, primary: true
#set :port, 25000
ssh_options[:forward_agent] = true



task :setup_config, roles: :app do
  #sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  #sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  #run "mkdir -p #{shared_path}/config"
  #put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
  #puts "Now edit the config files in #{shared_path}."
end
 after "deploy:setup", "deploy:setup_config"

after 'deploy:update_code', 'deploy:symlink_db'

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{deploy_to}/current/config/database.yml"
  end
end

task :symlink_config, roles: :app do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end


require 'simple-capistrano-unicorn'
after :deploy, "unicorn:restart"

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

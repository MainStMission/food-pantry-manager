require 'pry'
require 'erb'

namespace :monit do
  desc "Install Monit"
  task :install do
    run "#{sudo} yum install monit"
  end
  after "deploy:install", "monit:install"

  desc "Setup all Monit configuration"
  task :setup do
    #monit_config "monitrc", "/etc/monit/monitrc"
    nginx
    #postgresql
    unicorn
    syntax
    reload
  end
  after "deploy:setup", "monit:setup"
  
  task(:nginx, roles: :web) { monit_config "nginx" }
  task(:postgresql, roles: :db) { monit_config "postgresql" }
  task(:unicorn, roles: :app) { monit_config "unicorn" }

  %w[start stop restart syntax reload].each do |command|
    desc "Run Monit #{command} script"
    task command do
      run "#{sudo} service monit #{command}"
    end
  end
end

def monit_config(name, destination = nil)
  destination ||= "/etc/monit/conf.d/#{name}.conf"
  template "templates/monit/#{name}.erb", "/tmp/monit_#{name}"
  run "#{sudo} mv /tmp/monit_#{name} #{destination}"
  run "#{sudo} chown root #{destination}"
  run "#{sudo} chmod 600 #{destination}"
end

def template(source_file, dest_file)
  file = File.join(File.dirname(__FILE__), source_file)
  template = File.read(file)
  buffer = ERB.new(template).result(binding)
  put buffer, dest_file, :mode => 0444
end

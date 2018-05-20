set(:unicorn_user) { user }
set(:unicorn_pid) { "#{shared_path}/pids/unicorn.pid" }
set(:unicorn_config) { "#{current_path}/config/unicorn.rb" }
set(:unicorn_log) { "#{shared_path}/log/unicorn.log" }
set(:unicorn_workers, 2)

namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration"
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    #template "templates/unicorn.rb.erb", unicorn_config
    template "templates/unicorn_init.erb", "/tmp/unicorn_init"
    run "chmod +x /tmp/unicorn_init"
    run "#{sudo} mv /tmp/unicorn_init /etc/init.d/unicorn_#{application}"
    run "#{sudo} update-rc.d -f unicorn_#{application} defaults"
  end
  after "deploy:setup", "unicorn:setup"

  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :app do
      run "#{sudo} service unicorn_#{application} #{command}"
    end
    after "deploy:#{command}", "unicorn:#{command}"
  end
end


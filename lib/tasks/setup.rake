namespace :setup do
  setup_task :secret_token do
    secret_token = File.join(Rails.root, 'config', 'initializers', 'secret_token.rb')

    unless File.exists?(secret_token)
      secret   = SecureRandom.hex(64)
      template = ERB.new(File.read(secret_token + '.example'))

      File.open(secret_token, 'w') {|f| f.write(template.result(binding)) }
    end

    done "secret_token.rb"
  end
end

desc 'Setup FoodPantry from scratch'
setup_task :setup do
  puts # Empty line
  puts "#{heart} Thanks for helping us help others #{heart}"

  section "Configuration Files" do

    database = File.join(Rails.root, 'config', 'database.yml')

    unless File.exists?(database)
      create_file(database, "Database config", true)
    else
      done "database.yml"
    end

    Rake::Task["setup:secret_token"].invoke

    # If any other configuration files are required, they should be added here
  end

  section "Database" do
    begin
      # Check if there are pending migrations
      silence { Rake::Task["db:abort_if_pending_migrations"].invoke }
    rescue Exception
      silence do
        Rake::Task["db:create"].invoke
        Rake::Task["db:schema:load"].invoke
      end
    end

    done "Database created"
    done "Schema loaded"

    # Load the Rails Env now that the databases are setup
    Rake::Task["environment"].invoke

    Rake::Task["db:seed"].invoke
    done "Seed data imported"
  end

  puts # Empty Line
  puts %{#{'===='.color(:green)} Setup Complete #{'===='.color(:green)}}
  puts # Empty Line

  if console.agree("Would you like to run the test suite? (y/n)")
    Rake::Task["spec"].invoke
  end

end
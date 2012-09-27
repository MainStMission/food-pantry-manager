desc 'Setup FoodPantry from scratch'
setup_task :setup do
  puts # Empty line
  puts "#{heart} Thanks for helping us help others #{heart}"

  section "Environment Variables" do
    env = File.join(Rails.root, ".env")

    unless File.exists?(env)
      secret   = SecureRandom.hex(64)
      template = ERB.new(File.read(env + ".example"))

      File.write(env, template.result(binding))
    end

    done ".env"
  end

  section "Configuration Files" do

    database = File.join(Rails.root, 'config', 'database.yml')

    unless File.exists?(database)
      create_file(database, "Database config", true)
    else
      done "database.yml"
    end

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

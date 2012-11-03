# -*- encoding : utf-8 -*-
desc 'Setup FoodPantry from scratch'
setup_task :setup do
  puts # Empty line
  puts "#{heart} Thanks for helping us help others #{heart}"

  section "Environment Variables" do
    cfg = File.join(Rails.root, "config", "config.yml")
    find_or_create_file(cfg, "Environment Variables config", false)
    done "config.yml"
  end

  section "Configuration Files" do
    database = File.join(Rails.root, 'config', 'database.yml')
    find_or_create_file(database, "Database config", false)
    done "database.yml"

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
    # ensure test db gets migrated as well
    Rake::Task["db:schema:load"].reenable

    Rake::Task["spec"].invoke
    Rake::Task["cucumber"].invoke
  end

end

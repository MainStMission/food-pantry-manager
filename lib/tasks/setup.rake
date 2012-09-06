require 'fileutils'
require 'rainbow'
require 'highline'

desc 'Setup FoodPantry from scratch'
task :setup do
  console   = HighLine.new
  checkmark = "\u2713".color(:green)
  heart     = "\u2665".color(:red)

  puts # Empty line
  puts "#{heart}  Thanks for helping us help others #{heart}"

  section "Configuration Files" do

    database     = File.join(Rails.root, 'config', 'database.yml')
    secret_token = File.join(Rails.root, 'config', 'initializers', 'secret_token.rb')
    unless File.exists?(database)
      create_file(database, "Database config", true)
    else
      puts %{#{checkmark} database.yml}
    end

    unless File.exists?(secret_token)
      secret   = SecureRandom.hex(64)
      template = ERB.new(File.read(secret_token + '.example'))

      File.open(secret_token, 'w') {|f| f.write(template.result(binding)) }
    end

    puts "#{checkmark} secret_token.rb"

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

    puts %{#{checkmark} Database created}
    puts %{#{checkmark} Schema loaded}

    # Load the Rails Env now that the databases are setup
    Rake::Task["environment"].invoke

    Rake::Task["db:seed"].invoke
    puts "#{checkmark} Seed data imported"
  end

  puts # Empty Line
  puts %{#{'===='.color(:green)} Setup Complete #{'===='.color(:green)}}
  puts # Empty Line

  if console.agree("Would you like to run the test suite? (y/n)")
    Rake::Task["spec"].invoke
  end

end

private

def section(description)
  puts # Empty Line
  puts description.underline
  puts # Empty Line
  yield
end

def silence
  begin
    orig_stderr = $stderr.clone
    orig_stdout = $stdout.clone

    $stderr.reopen File.new('/dev/null', 'w')
    $stdout.reopen File.new('/dev/null', 'w')

    return_value = yield
  rescue Exception => e
    $stdout.reopen orig_stdout
    $stderr.reopen orig_stderr
    raise e
  ensure
    $stdout.reopen orig_stdout
    $stderr.reopen orig_stderr
  end

  return_value
end

def create_file(file, name, requires_edit=false)
  FileUtils.cp(file + '.example', file)

  if requires_edit
    puts "Update #{file} and run `bundle exec rake setup` to continue".color(:red)
    system(ENV['EDITOR'], file) unless ENV['EDITOR'].blank?
    exit
  end
end
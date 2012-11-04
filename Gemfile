require "rbconfig"
HOST_OS = RbConfig::CONFIG["host_os"]

source :rubygems

gem "rails", "3.2.8"
gem "pg"
gem "sqlite3"

gem "puma"
gem "rails_setup", "~> 0.0.2"
gem "devise", "~> 2.1.2"
gem 'attr_encryptor'
gem 'strong_parameters'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails",     "~> 3.2.3"
  gem "coffee-rails",   "~> 3.2.1"
  gem "bootstrap-sass", "~> 2.0.3"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem "therubyracer", :platform => :ruby

  gem "uglifier", ">= 1.0.3"
end

gem "jquery-rails"
gem "haml-rails"
gem "bourbon"
gem "simple_form"

group :test do
  gem "cucumber-rails", :require => false
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "factory_girl_rails", "~> 4.0"
end

guard_notifications = false
group :development do
  case HOST_OS
  when /darwin/i
    gem "rb-fsevent"
    gem "ruby_gntp" if guard_notifications
  when /linux/i
    gem "libnotify"
    gem "rb-inotify"
  when /mswin|windows/i
    gem "rb-fchange"
    gem "win32console"
    gem "rb-notifu" if guard_notifications
  end

  gem "guard-livereload"
  gem "yajl-ruby"
  gem "rack-livereload"
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "timecop"
end

group :development, :test do
  gem "rspec-rails"
  gem "pry"
end

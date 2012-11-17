require "rbconfig"
HOST_OS = RbConfig::CONFIG["host_os"]

source :rubygems

gem "rails", "3.2.8"

# Database Configuration
  unless ENV['TRAVIS']
   gem 'activerecord-jdbcsqlite3-adapter', :platform => :jruby
   gem 'sqlite3', :platform => :ruby, :group  => [:development, :test]
  end

  unless ENV['TRAVIS'] && ENV['DB'] != 'mysql'
    gem 'activerecord-jdbcmysql-adapter', :platform => :jruby
    gem 'mysql2', :platform => :ruby
  end

  unless ENV['TRAVIS'] && ENV['DB'] != 'postgresql'
    gem 'activerecord-jdbcpostgresql-adapter', :platform => :jruby
    gem 'pg', :platform => :ruby 
  end

   gem 'jruby-openssl', :platform => :jruby
   gem 'json-jruby', :platform  => :jruby
   gem 'yajl-ruby', :platform  => :ruby

gem "puma"
gem "rails_setup", "~> 0.0.2"
gem "devise", "~> 2.1.2"
gem "strong_parameters"

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
gem "attr_encryptor"
gem "decent_exposure", "~> 2.0.0"

group :test do
  gem "cucumber-rails", :require => false
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "factory_girl_rails", "~> 4.0"
  gem "poltergeist"
end

group :development do
  gem "rb-fsevent", :require => RUBY_PLATFORM.include?("darwin") && "rb-fsevent"
  gem "ruby_gntp", :require => RUBY_PLATFORM.include?("darwin") && "ruby_gntp"
  gem "libnotify", :require => RUBY_PLATFORM.include?("linux") && "libnotify"
  gem "rb-inotify", :require => RUBY_PLATFORM.include?("linux") && "rb-inotify"

  gem "rb-fchange", :platform => :mswin
  gem "win32console", :platform => :mswin
  gem "rb-notifu", :platform => :mswin

  gem "guard-livereload"

  gem "rack-livereload"
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "timecop"
end

group :development, :test do
  gem "rspec-rails"
  gem "pry-rails"
end

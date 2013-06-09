require "rbconfig"
HOST_OS = RbConfig::CONFIG["host_os"]

source "https://rubygems.org"

gem 'rails', '3.2.12'
gem 'nokogiri'
gem 'pg'
gem 'rails_setup'
gem 'devise'
gem 'strong_parameters'
gem 'cocoon'
gem 'meta_search',    '>= 1.1.0.pre'
gem 'ransack'
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'kaminari'
gem 'newrelic_rpm'
gem 'rails_admin'
gem 'cancan'
gem 'paper_trail', '~> 2'
gem 'rack-mini-profiler'
gem "Ascii85", "~> 1.0.2"
gem 'prawn'
gem 'capistrano'
gem 'simple-capistrano-unicorn'
gem 'rvm-capistrano', '>=1.3.0.rc4'
gem 'unicorn'

group :assets do
  gem "Ascii85", "~> 1.0.2"
  gem 'coffee-rails'
  gem 'sass-rails','~> 3.2'
  gem 'bootstrap-sass', '~> 2.3.1.0'
  gem 'uglifier'
  gem 'font-awesome-rails'
  gem 'kaminari-bootstrap'
  gem "jquery-rails", "2.3.0"
  gem 'jquery_datepicker'
  gem 'haml-rails'
  gem 'bourbon'
  gem 'simple_form'
end

gem 'attr_encryptor'
gem 'decent_exposure'

group :development, :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'launchy'
  gem 'rspec-rails', '~> 2.12'
  gem 'faker'
  gem 'pry-rails'
  gem 'pdf-inspector', :require => "pdf/inspector"
  gem 'rb-fsevent', :require => RUBY_PLATFORM.include?("darwin") && "rb-fsevent"
  gem 'ruby_gntp',  :require => RUBY_PLATFORM.include?("darwin") && "ruby_gntp"
  gem 'libnotify',  :require => RUBY_PLATFORM.include?("linux")  && "libnotify"
  gem 'rb-inotify', :require => RUBY_PLATFORM.include?("linux")  && "rb-inotify"
  gem 'factory_girl_rails'
  gem 'rb-fchange',   :platform => :mswin
  gem 'win32console', :platform => :mswin
  gem 'rb-notifu',    :platform => :mswin
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'guard-livereload'
  gem 'yajl-ruby'
  gem 'rack-livereload'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'timecop'
  gem 'sqlite3'
  gem 'foreman'
  gem 'zeus'
  gem 'spork', '~> 1.0rc'

end



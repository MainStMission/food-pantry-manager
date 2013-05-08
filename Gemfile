require "rbconfig"
HOST_OS = RbConfig::CONFIG["host_os"]

source "https://rubygems.org"

gem 'rails', '3.2.12'
gem 'nokogiri'
gem 'pg'
gem 'puma'
gem 'rails_setup'
gem 'devise'
gem 'strong_parameters'
gem 'cocoon'
gem 'meta_search',    '>= 1.1.0.pre'
gem 'kaminari'
gem 'newrelic_rpm'

gem 'prawn'

group :assets do
  gem 'coffee-rails'
  gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
  gem 'sass-rails','~> 3.2'
  gem 'bootstrap-sass', '~> 2.3.1.0'
  gem 'bootstrap-will_paginate'
  gem 'uglifier'
  gem 'font-awesome-rails'
  gem 'jquery-rails'
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
  gem 'meta_request', '0.2.1'
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



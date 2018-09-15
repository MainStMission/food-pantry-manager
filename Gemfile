require "rbconfig"
HOST_OS = RbConfig::CONFIG["host_os"]

source "https://rubygems.org"

gem 'rails', '3.2.12'
gem 'nokogiri'
gem  'pg'
gem 'squeel', '~> 1.1'
gem 'rails_setup'
gem 'devise'
gem 'strong_parameters'
gem 'permitters', '~> 0.0.1'
gem 'cocoon'
# gem 'meta_search',    '>= 1.1.0.pre'
gem 'ransack', '~> 1.0.0'
gem 'has_scope', '~> 0.6.0' 
gem 'simple_form'
gem 'by_star', '~> 2.2', '>= 2.2.1'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'kaminari'
gem 'rails_admin'
gem 'american_date'
gem 'cancan'
gem 'paper_trail', '~> 2'
gem 'prawn'
gem 'prawn-print', :git => 'git://github.com/barsoom/prawn-print.git'
# gem 'backup-task'
gem 'unicorn'
gem 'active_model_serializers'
gem 'turbolinks'
gem 'restful_json', '~> 4.2.0'


group :assets do
  gem "Ascii85", "~> 1.0.2"
  gem 'coffee-rails'
  gem 'sass-rails','~> 3.2'
  gem 'bootstrap-sass', '~> 2.3.1.0'
  gem 'uglifier'
  gem 'font-awesome-rails' , '~> 3.2.0.0'
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
  gem 'bullet', '< 5.5.0'
  gem 'capistrano'
  gem 'simple-capistrano-unicorn'
  gem 'rvm-capistrano', '>=1.3.0.rc4', require: false
  # gem 'chrome_logger',  :require => 'chrome_logger/railtie'
  gem 'rack-mini-profiler'
  gem 'capybara', '~> 2.17'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'launchy'
  gem 'rspec-rails', '~> 2.99'
  gem 'rspec-its', '~> 1.0'
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
  # gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
  gem 'yajl-ruby'
  gem 'rack-livereload'
  # gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'timecop'
  gem 'sqlite3'
  gem 'foreman'
  gem 'zeus'
  gem 'spork', '~> 1.0rc'
end



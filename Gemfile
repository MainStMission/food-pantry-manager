require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'pg'
gem "sqlite3", :group => [:development, :test]

gem 'puma'
gem 'rails_setup', '~> 0.0.2'
gem "devise", "~> 2.1.2"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',     '~> 3.2.3'
  gem 'coffee-rails',   '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.0.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'bourbon'
gem 'simple_form'

group :test do
  gem "cucumber-rails", :require => false
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
end

group :development do
  gem 'rb-fsevent', :require => RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'ruby_gntp', :require => RUBY_PLATFORM.include?('darwin') && 'ruby_gntp'
  gem 'libnotify', :require => RUBY_PLATFORM.include?('linux') && 'libnotify'
  gem 'rb-inotify', :require => RUBY_PLATFORM.include?('linux') && 'rb-inotify'

  gem 'rb-fchange', :platform => :mswin
  gem 'win32console', :platform => :mswin
  gem 'rb-notifu', :platform => :mswin

  gem "guard-livereload"
  gem "yajl-ruby"
  gem "rack-livereload"
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "timecop"
end

gem "rspec-rails", :group => [:development, :test]

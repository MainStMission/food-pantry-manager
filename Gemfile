HOST_OS = RbConfig::CONFIG['host_os']

source :rubygems

<<<<<<< HEAD
gem 'rails', '3.2.8'
gem 'pg'
gem 'sqlite3', :group => [:development, :test]

gem 'puma'
gem 'rails_setup', '~> 0.0.2'
gem 'devise', '~> 2.1.2'
gem 'strong_parameters'
=======
gem "rails", "3.2.8"
gem "pg"
gem "puma"
gem "rails_setup"
gem "devise"
gem "strong_parameters"
>>>>>>> 67f98545595520f7e7ea9942adac78f1f63c4d31

group :assets do
<<<<<<< HEAD
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
gem 'attr_encryptor'
gem 'decent_exposure', '~> 2.0.0'

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'factory_girl_rails', '~> 4.0'
end

group :development do
  gem 'rb-fsevent', :require => RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'ruby_gntp', :require => RUBY_PLATFORM.include?('darwin') && 'ruby_gntp'
  gem 'libnotify', :require => RUBY_PLATFORM.include?('linux') && 'libnotify'
  gem 'rb-inotify', :require => RUBY_PLATFORM.include?('linux') && 'rb-inotify'

  gem 'rb-fchange', :platform => :mswin
  gem 'win32console', :platform => :mswin
  gem 'rb-notifu', :platform => :mswin

  gem 'guard-livereload'
  gem 'yajl-ruby'
  gem 'rack-livereload'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'timecop'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-rails'
=======
  gem "sass-rails"
  gem "coffee-rails"
  gem "bootstrap-sass"
  gem "uglifier"
end

gem "jquery-rails"
gem "haml-rails"
gem "bourbon"
gem "simple_form"
gem "attr_encryptor"
gem "decent_exposure"

group :development, :test do
  gem "cucumber-rails", :require => false
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "pry-rails"
  gem "rb-fsevent", :require => RUBY_PLATFORM.include?("darwin") && "rb-fsevent"
  gem "ruby_gntp",  :require => RUBY_PLATFORM.include?("darwin") && "ruby_gntp"
  gem "libnotify",  :require => RUBY_PLATFORM.include?("linux")  && "libnotify"
  gem "rb-inotify", :require => RUBY_PLATFORM.include?("linux")  && "rb-inotify"

  gem "rb-fchange",   :platform => :mswin
  gem "win32console", :platform => :mswin
  gem "rb-notifu",    :platform => :mswin

  gem "guard-livereload"
  gem "yajl-ruby"
  gem "rack-livereload"
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "timecop"
  gem "sqlite3"
  gem "foreman"
>>>>>>> 67f98545595520f7e7ea9942adac78f1f63c4d31
end

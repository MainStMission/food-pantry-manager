# -*- encoding : utf-8 -*-
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "rspec/autorun"

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.order = "random"
end

RSpec.configure do |config| 
  config.include FactoryGirl::Syntax::Methods
end


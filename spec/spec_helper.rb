# -*- encoding : utf-8 -*-
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require_relative "active_record_spec_helper"
require "rspec/rails"
require "rspec/autorun"

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
end

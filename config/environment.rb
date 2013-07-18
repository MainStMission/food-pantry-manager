# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FoodPantry::Application.initialize!

ActionController::Base.send :include, ActionController::Permittance

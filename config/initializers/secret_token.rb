# -*- encoding : utf-8 -*-
# Guess what, I stole this from rstat.us too!!! <3 <3 <3
#
# Be sure to restart your server when you modify this file.

SECRET_TOKEN = !binary |-
MTA1ODlmMzU0NGEwYTAyN2Q5NDUzMDNjYzQxOGYwNDJlMmVkMzQ5YjQyZDYy
Y2NhMjgxZDljZTY0NGE1

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

if ENV["SECRET_TOKEN"].blank?
  if Rails.env.production? || Rails.env.staging?
    raise "You must set ENV[\"SECRET_TOKEN\"] in your app's config vars"
  elsif Rails.env.test?
    # Generate the key and test away
    ENV["SECRET_TOKEN"] = FoodPantry::Application.config.secret_token = SecureRandom.hex(30)
  else
    # Generate the key, set it for the current environment, update the yaml file and move on
    config_file = File.expand_path(File.join(Rails.root, '/config/config.yml'))
    config = YAML.load_file(config_file)
    ENV["SECRET_TOKEN"] = config[Rails.env]['SECRET_TOKEN'] = SecureRandom.hex(30)
    File.write(config_file, config.to_yaml)
  end
end

FoodPantry::Application.config.secret_token = ENV["SECRET_TOKEN"]

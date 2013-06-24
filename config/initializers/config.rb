# -*- encoding : utf-8 -*-
# stolen from rstat.us


# Date::DATE_FORMATS[:default] = "%m/%d/%Y"



require 'fileutils'

unless Rails.env.production? || Rails.env.staging?
  config_file = Rails.root.join("config/config.yml")
  FileUtils.cp((config_file.to_s + ".example"), config_file) unless config_file.exist?

  config = YAML.load_file(config_file)[Rails.env]

  config.each do |key, value|
    ENV[key] = value if ENV[key].blank?
  end
end

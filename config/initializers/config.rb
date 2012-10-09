# stolen from rstat.us

require 'fileutils'

unless Rails.env.production?
  config_file = File.expand_path(File.join(Rails.root, '/config/config.yml'))
  config_file_sample = File.expand_path(File.join(Rails.root, '/config/config.yml.sample'))

  FileUtils.cp(config_file_sample, config_file) unless File.exists?(config_file)

  config = YAML.load_file(config_file)[Rails.env]

  config.each do |key, value|
    ENV[key] = value if ENV[key].blank?
  end
end

require "fileutils"

desc "Setup a new environment"
task "setup" do
  # Setup bundler and dependencies
  sh "gem install bundler"
  sh "bundle install"

  # Setup database
  FileUtils.cp "config/database.yml.example", "config/database.yml"
  sh "bundle exec rake db:create:all"
  sh "bundle exec rake db:migrate"

  # Run tests
  sh "rake"
end

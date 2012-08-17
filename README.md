[Main St Mission's](http://www.mainstmission.org/) food-pantry-manager
===================

[![Build Status](https://secure.travis-ci.org/MainStMission/food-pantry-manager.png?branch=master)](http://travis-ci.org/MainStMission/food-pantry-manager)

##Contributing

  1. fork the repo
  2. Run bundler

        bundle install
  3. Setup your database

        cp config/database.yml.example config/database.yml
      
        bundle exec rake db:create:all

        bundle exec rake db:migrate
  4. Start the server
  5. Make some changes
  6. Run the tests

        bundle exec rake
  6. Submit a Pull Request on github (We would like to review the code)
  7. Keep being AWESOME!
  

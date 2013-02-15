# -*- encoding : utf-8 -*-

unless User.find_by_email("user@example.com").present?
  user = User.create! :first_name => 'First', :last_name => 'User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
  puts 'New user created: ' << user.name
end

unless User.find_by_email("user2@example.com").present?
  user2 = User.create! :first_name => 'Second', :last_name => 'User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
  puts 'New user created: ' << user2.name
end


require_relative '../app/models/access_level'
module AccessLevelSeeds
    puts 'SETTING UP DEFAULT ACCESS LEVELS'
    AccessLevel.create!(name: "Volunteer", level: 1)
    AccessLevel.create!(name: "Super-Volunteer", level: 2)
    AccessLevel.create!(name: "Admin", level: 3)
end

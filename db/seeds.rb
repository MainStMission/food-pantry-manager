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
puts 'SETTING UP DEFAULT ACCESS LEVELS'
unless AccessLevelSeeds.find_by_name("Volunteer").present?
    AccessLevel.create!(name: "Volunteer", level: 1)
end
unless AccessLevelSeeds.find_by_name("Super-Volunteer").present?
    AccessLevel.create!(name: "Super-Volunteer", level: 2)
end
unless AccessLevelSeeds.find_by_name("Admin").present?
    AccessLevel.create!(name: "Admin", level: 3)
end

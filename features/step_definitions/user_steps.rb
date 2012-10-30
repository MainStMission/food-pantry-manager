### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "please", :password_confirmation => "please" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = User.create(:email => 'example@example.com',
                      :password => 'please',
                      :password_confirmation => 'please',
                      :first_name => 'Test',
                      :last_name => 'User')
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "Name", :with => @visitor[:name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I create a user with these attributes$/ do |table|
  # table is a Cucumber::Ast::Table
  visit new_user_path
  attrs = hash_from_table(table)
  fill_in "user_first_name", :with => attrs.fetch('first_name')
  fill_in "user_last_name", :with => attrs.fetch('last_name')
  click_button "save_user"
end

Given /^I change the Test User's last name to Frog$/ do
  user = User.where(:first_name => 'Test').first
  visit edit_user_path(user)
  fill_in "user_last_name", :with => "Frog"
  click_button "save_user"
end

Then /^I should see "(.*?)" for the user$/ do |value|
  page.should have_content(value)
end

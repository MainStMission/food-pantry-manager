Given /^I create a user with these attributes$/ do |table|
  # table is a Cucumber::Ast::Table
  visit new_user_path
  attrs = Hash[*table.raw.flatten]
  fill_in "user_first_name", :with => attrs.fetch('first_name')
  fill_in "user_last_name", :with => attrs.fetch('last_name')
  click_button "save_user"
end

Given /^I change Piggy's last name to Frog$/ do
  user = User.create(:first_name => "Piggy")
  visit edit_user_path(user)
  fill_in "user_last_name", :with => "Frog"
  click_button "save_user"
end

Then /^I should see "(.*?)"$/ do |value|
  page.should have_content(value)
end

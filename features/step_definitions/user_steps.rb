Given /^I create a user with these attributes$/ do |table|
  # table is a Cucumber::Ast::Table
  visit new_user_path
  attrs = Hash[*table.raw.flatten]
  fill_in "user_first_name", :with => attrs.fetch('first_name')
  fill_in "user_last_name", :with => attrs.fetch('last_name')
  click_button "create_user"
end
  #
Then /^I should see "(.*?)"$/ do |value|
  page.should have_content(value)
end

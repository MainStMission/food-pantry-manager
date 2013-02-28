

Given /^a household exists$/ do
  @household = Household.create(default_attributes)
end



#When /^I create a household called "(.*?)"/ do |household|
#          visit new_household_path
#          fill_in "Household", with: "#{household}"
#          fill_in "First name", with: 'Tom'
#          fill_in "Last name" , with:  "#{household}"
#          click_button "Create Household"
#end


#Then /^I should see Bronson for the household name/ do
#  visit households_path
#  page.should have_content "Bronson"
#end

When /^I create a household with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_household_path

  @attributes.each do |attr, val|
    fill_in "household_#{attr}", with: val unless attr == 'status'
  end
  select(@attributes.fetch('status').capitalize, from: 'household_status')
  click_button "Create Household"
end

When /^I edit a household with new attributes$/ do
  visit edit_household_path(@volunteer)
  fill_in "household[first_name]", with: 'Piggie'
  click_button 'Update Household'
end

When /^I delete the household$/ do
  visit households_path
  click_link 'Destroy'
end

When /^I sign in as the household$/ do
  visit time_clock_path
  within "#household_#{@volunteer.to_param}" do
    click_link 'Sign In'
  end
end

When /^I sign out as the household$/ do
  visit time_clock_path
  within "#household_#{@volunteer.to_param}" do
    click_link 'Sign Out'
  end
end


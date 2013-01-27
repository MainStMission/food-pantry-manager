# -*- encoding : utf-8 -*-
default_attributes = {
    first_name: 'Kermit',
    last_name: 'Frog',
    email: 'kermit@example.com',
    street: '1201 Grand Central Avenue',
    city: 'Glendale',
    state: 'CA',
    zip: '91201',
    status: 'active',
    phone: '555-999-2222'
}

Given /^a volunteer exists$/ do
  @volunteer = Volunteer.create(default_attributes)
end

When /^I create a volunteer with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_volunteer_path

  @attributes.each do |attr, val|
    fill_in "volunteer_#{attr}", with: val unless attr == 'status'
  end
  select(@attributes.fetch('status').capitalize, from: 'volunteer_status')
  click_button "Create Volunteer"
end

When /^I edit a volunteer with new attributes$/ do
  visit edit_volunteer_path(@volunteer)
  fill_in "volunteer[first_name]", with: 'Piggie'
  click_button 'Update Volunteer'
end

When /^I delete the volunteer$/ do
  visit volunteers_path
  click_link 'Destroy'
end

When /^I signin as the volunteer$/ do
  visit time_clock_path
  within "#volunteer_#{@volunteer.to_param}" do
    click_link 'Sign In'
  end
end

When /^I signout as the volunteer$/ do
  visit time_clock_path
  within "#volunteer_#{@volunteer.to_param}" do
    click_link 'Sign Out'
  end
end

Then /^the volunteer should be signed out$/ do
  within "#volunteer_#{@volunteer.to_param}" do
    page.should have_content("Sign In")
  end
end

Then /^I should see Gonzo$/ do
  visit volunteers_path
  page.should have_content "Gonzo"

  click_link("Edit")
  @attributes.each do |attr, val|
    node = find(:xpath, "//*[(@id = 'volunteer_#{attr}')]")
    val = val.capitalize if val == "active"
    node.value.should have_content val
  end
end

Then /^I should see the new attributes for the volunteer$/ do
  page.should have_content('Piggie')
end


Then /^I should not see the volunteer$/ do
  page.should_not have_content(@volunteer.first_name)
end

Then /^the volunteer should be signed in$/ do
  within "#volunteer_#{@volunteer.to_param}" do
    page.should have_content("Sign Out")
  end
end

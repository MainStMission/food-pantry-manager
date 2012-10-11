default_attributes = {
    :first_name => 'Anne',
    :last_name => 'Main',
    :email => 'Anne@example.com',
    :street => '306 Mains Street',
    :city => 'China Grove',
    :state => 'NC',
    :zip => '91201',
    :status => 'active',
    :phone => '555-999-2222'
}

Given /^a volunteer exits$/ do
  @volunteer = Volunteer.create(default_attributes)
end

When /^I create a volunteer with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_volunteer_path

  @attributes.each do |attr, val|
    fill_in "volunteer_#{attr}", :with => val
  end
  click_button "Save"
end

When /^I edit a volunteer with new attributes$/ do
  visit edit_volunteer_path(@volunteer)
  fill_in "volunteer[first_name]", :with => 'Piggie'
  click_button 'Save'
end

When /^I delete the volunteer$/ do
  visit volunteers_path
  click_link 'Destroy'
end

Then /^I should see Gonzo$/ do
  visit volunteers_path
  page.should have_content "Gonzo"

  click_link("Edit")
  @attributes.each do |attr, val|
    page.should have_xpath("//input[@value='#{val}']")
  end
end

Then /^I should see the new attributes for it$/ do
  page.should have_content(@volunteer.reload.first_name)
end


Then /^I should not see the volunteer$/ do
  page.should_not have_content(@volunteer.first_name)
end

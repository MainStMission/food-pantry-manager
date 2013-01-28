# -*- encoding : utf-8 -*-
default_attributes = {
    :first_name => 'Sally',
    :last_name => 'James',
    :street => '1201 Grand Central Avenue',
    :city => 'Glendale',
    :state => 'CA',
    :zip => '91201',
    :phone => '555-999-2222'
}


Given /^a neighbor exists$/ do
  @volunteer = Neighbor.create(default_attributes)
end

When /^I create a neighbor with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_neighbor_path

  @attributes.each do |attr, val|
    fill_in "neighbor_#{attr}", :with => val
  end
  #click_button "Save"
end



When /^I edit a neighbor with new attributes$/ do
  visit edit_neighbor_path(@volunteer)
  fill_in "neighbor[first_name]", :with => 'Pete'
  click_button 'Save'
end

When /^I delete the neighbor$/ do
  visit volunteers_path
  click_link 'Destroy'
end

Then /^I should see Anne$/ do
  visit neighbors_path
  page.should have_content "Anne"

  click_link("Edit")
  @attributes.each do |attr, val|
    page.should have_xpath("//input[@value='#{val}']")
  end
end

Then /^I should see the new attributes for it$/ do
  page.should have_content(@volunteer.reload.first_name)
end


Then /^I should not see the neighbor$/ do
  page.should_not have_content(@neighbor.first_name)
end

default_attributes = {
  :first_name => 'Kermit',
  :last_name => 'Frog',
  :phone => '555-999-2222',
  :street => '1201 Grand Central Avenue',
  :city => 'Glendale',
  :state => 'CA',
  :zip => '91201',
  :ss_numb => '023-45-4321',
  :monthly_income => 250.00,  
  :food_stamps => 150.00,
  :rent => 240.00,
  :utilities => 275.00,
  # :residency_date => '2012-12-01',
  # :spouse => false,
  :number_of_children => 4,
  # :open_date => 2011-03-04,
  # :close_date => 2012-04-05,
  :proof_of_residency_type => 'green card',
  # :date_of_proof => 2012-02-03,
  # :smokes => true
}

Given /^a neighbor exists$/ do
  @neighbor = Neighbor.create(default_attributes)
end

When /^I create a neighbor with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_neighbor_path

  @attributes.each do |attr, val|
    fill_in "neighbor_#{attr}", :with => val
  end
  click_button "Create Neighbor"
end

When /^I edit a neighbor with new attributes$/ do
  visit edit_neighbor_path(@neighbor)
  fill_in "neighbor[first_name]", :with => 'Tom'
  click_button 'Update Neighbor'
end

When /^I delete the neighbor$/ do
  visit neighbors_path
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

Then /^I should see the new attributes for the neighbor$/ do
  page.should have_content(@neighbor.reload.first_name)
end


Then /^I should not see the neighbor$/ do
  page.should_not have_content(@neighbor.first_name)
end

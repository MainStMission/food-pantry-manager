default_attributes = { :name => "Friendly Neighbor" }

Given /^a donor exists$/ do
  @donor = Donor.create(default_attributes)
end

When /^I edit a donor with new attributes$/ do
  visit edit_donor_path(@donor)
  fill_in "donor[name]", :with => 'Neighbor'
  click_button 'Update Donor'
end

When /^I create a donor with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_donor_path

  @attributes.each do |attr, val|
    fill_in "donor_#{attr}", :with => val
  end
  click_button "Create Donor"
end

When /^I delete the donor/ do
  visit donors_path
  click_link 'Destroy'
end

Then /^I should not see the donor/ do
  page.should_not have_content(@donor.name)
end

Then /^I should see "([^"]*)" for the donor$/ do |text|
  visit donors_path
  page.should have_content text

  click_link("Edit")
  @attributes.each do |attr, val|
    page.should have_xpath("//input[@value='#{val}']")
  end
end

Then /^I should see the new attributes for the donor$/ do
  page.should have_content(@donor.reload.name)
end

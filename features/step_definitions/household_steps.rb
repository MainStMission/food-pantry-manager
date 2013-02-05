
$model_default_attributes.household =  { :household_name => "Friendly Neighbor" }


When /^I create a household with this attribute$/ do |table|
  @attributes = hash_from_table(table)
  visit new_household_path
end


Then /^I should see Bronson$/ do
  visit households_path
  page.should have_content "Bronson"
end

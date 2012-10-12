default_attributes = {
    :cust_first_name => 'Kermit',
    :cust_last_name => 'Frog',
    :cust_email => 'kermit@example.com',
    :cust_street => '1201 Grand Central Avenue',
    :cust_city => 'Glendale',
    :cust_state => 'CA',
    :cust_zip => '91201',
    :cust_status => 'active',
    :cust_phone => '555-999-2222',
    :cust_ss_numb =>'222-11-3333',
    :cust_family => 5,
}



Given /^a customer exits$/ do
  @customer = Customer.create(default_attributes)
end

When /^I create a customer with these attributes$/ do |table|
  @attributes = hash_from_table(table)
  visit new_customer_path
  @attributes.each do |attr, val|
    fill_in "customer_#{attr}", :with => val
  end
  click_button "Create Customer"
end

Then /^I should see the new customer$/ do
 visit customers_path
 page.should have_content "Anne"
end


When /^I edit a customer with new attributes$/ do
  visit edit_customer_path(@customer)
  fill_in "customer[cust_first_name]", :with => 'Kim'
  click_button 'Update Customer'
end


When /^I delete the customer$/ do
  visit customers_path
  click_link 'Destroy'
end

Then /^I should see Gonzo$/ do
  visit customers_path
  page.should have_content "Gonzo"
 click_link("Edit")
 @attributes.each do |attr, val|
   page.should have_xpath("//input[@value='#{val}']")
 end
end

Then /^I should see the new attributes for the customer$/ do
  visit customers_path
  page.should have_content(@customer.reload.cust_first_name)
end


Then /^I should not see the customer$/ do
  page.should_not have_content(@customer.cust_first_name)
end

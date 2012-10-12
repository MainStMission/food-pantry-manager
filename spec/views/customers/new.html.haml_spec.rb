require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :cust_first_name => "MyString",
      :cust_last_name => "MyString",
      :cust_email => "MyString",
      :cust_street => "MyString",
      :cust_city => "MyString",
      :cust_state => "MyString",
      :cust_state => "MyString",
      :cust_zip => "MyString",
      :cust_status => "MyString",
      :cust_phone => "MyString",
      :cust_ss_numb => "MyString",
      :cust_family => 1
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path, :method => "post" do
      assert_select "input#customer_cust_first_name", :name => "customer[cust_first_name]"
      assert_select "input#customer_cust_last_name", :name => "customer[cust_last_name]"
      assert_select "input#customer_cust_email", :name => "customer[cust_email]"
      assert_select "input#customer_cust_street", :name => "customer[cust_street]"
      assert_select "input#customer_cust_city", :name => "customer[cust_city]"
      assert_select "input#customer_cust_state", :name => "customer[cust_state]"
      assert_select "input#customer_cust_state", :name => "customer[cust_state]"
      assert_select "input#customer_cust_zip", :name => "customer[cust_zip]"
      assert_select "input#customer_cust_status", :name => "customer[cust_status]"
      assert_select "input#customer_cust_phone", :name => "customer[cust_phone]"
      assert_select "input#customer_cust_ss_numb", :name => "customer[cust_ss_numb]"
      assert_select "input#customer_cust_family", :name => "customer[cust_family]"
    end
  end
end

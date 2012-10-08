require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :cust_first_name => "Cust First Name",
        :cust_last_name => "Cust Last Name",
        :cust_email => "Cust Email",
        :cust_street => "Cust Street",
        :cust_city => "Cust City",
        :cust_state => "Cust State",
        :cust_state => "Cust State",
        :cust_zip => "Cust Zip",
        :cust_status => "Cust Status",
        :cust_phone => "Cust Phone",
        :cust_ss_numb => "Cust Ss Numb",
        :cust_family => 1
      ),
      stub_model(Customer,
        :cust_first_name => "Cust First Name",
        :cust_last_name => "Cust Last Name",
        :cust_email => "Cust Email",
        :cust_street => "Cust Street",
        :cust_city => "Cust City",
        :cust_state => "Cust State",
        :cust_state => "Cust State",
        :cust_zip => "Cust Zip",
        :cust_status => "Cust Status",
        :cust_phone => "Cust Phone",
        :cust_ss_numb => "Cust Ss Numb",
        :cust_family => 1
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cust First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Email".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Street".to_s, :count => 2
    assert_select "tr>td", :text => "Cust City".to_s, :count => 2
    assert_select "tr>td", :text => "Cust State".to_s, :count => 2
    assert_select "tr>td", :text => "Cust State".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Status".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Cust Ss Numb".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

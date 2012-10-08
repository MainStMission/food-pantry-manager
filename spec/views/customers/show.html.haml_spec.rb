require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cust First Name/)
    rendered.should match(/Cust Last Name/)
    rendered.should match(/Cust Email/)
    rendered.should match(/Cust Street/)
    rendered.should match(/Cust City/)
    rendered.should match(/Cust State/)
    rendered.should match(/Cust State/)
    rendered.should match(/Cust Zip/)
    rendered.should match(/Cust Status/)
    rendered.should match(/Cust Phone/)
    rendered.should match(/Cust Ss Numb/)
    rendered.should match(/1/)
  end
end

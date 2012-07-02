require 'spec_helper'

describe "volunteers/show" do
  before(:each) do
    @volunteer = assign(:volunteer, stub_model(Volunteer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone",
      :street => "Street",
      :city => "City",
      :state => "State",
      :zip => "Zip",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/Street/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/Status/)
  end
end

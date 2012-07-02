require 'spec_helper'

describe "volunteers/new" do
  before(:each) do
    assign(:volunteer, stub_model(Volunteer,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new volunteer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => volunteers_path, :method => "post" do
      assert_select "input#volunteer_first_name", :name => "volunteer[first_name]"
      assert_select "input#volunteer_last_name", :name => "volunteer[last_name]"
      assert_select "input#volunteer_email", :name => "volunteer[email]"
      assert_select "input#volunteer_phone", :name => "volunteer[phone]"
      assert_select "input#volunteer_street", :name => "volunteer[street]"
      assert_select "input#volunteer_city", :name => "volunteer[city]"
      assert_select "input#volunteer_state", :name => "volunteer[state]"
      assert_select "input#volunteer_zip", :name => "volunteer[zip]"
      assert_select "input#volunteer_status", :name => "volunteer[status]"
    end
  end
end

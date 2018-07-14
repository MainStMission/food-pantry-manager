require 'spec_helper'

describe "tokens/show" do
  before(:each) do
    @token = assign(:token, stub_model(Token,
      :household_id => 1,
      :initial_value => 2,
      :current_value => 3,
      :flavor => "Flavor",
      :isexpired => false
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/1/)
  #   rendered.should match(/2/)
  #   rendered.should match(/3/)
  #   rendered.should match(/Flavor/)
  #   rendered.should match(/false/)
  # end
end

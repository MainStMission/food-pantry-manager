require 'spec_helper'

describe "tokens/index" do
  before(:each) do
    assign(:tokens, [
      stub_model(Token,
        :household_id => 1,
        :initial_value => 2,
        :current_value => 3,
        :flavor => "Flavor",
        :isexpired => false
      ),
      stub_model(Token,
        :household_id => 1,
        :initial_value => 2,
        :current_value => 3,
        :flavor => "Flavor",
        :isexpired => false
      )
    ])
  end

  # it "renders a list of tokens" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  #   assert_select "tr>td", :text => 2.to_s, :count => 2
  #   assert_select "tr>td", :text => 3.to_s, :count => 2
  #   assert_select "tr>td", :text => "Flavor".to_s, :count => 2
  #   assert_select "tr>td", :text => false.to_s, :count => 2
  # end
end

require 'spec_helper'

describe "foods/index" do
  before(:each) do
    assign(:foods, [
      stub_model(Food,
        :description => "Description",
        :upc => "Upc",
        :guiding_star => 1,
        :f2e => "F2e",
        :tab_val => 2
      ),
      stub_model(Food,
        :description => "Description",
        :upc => "Upc",
        :guiding_star => 1,
        :f2e => "F2e",
        :tab_val => 2
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Upc".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "F2e".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

require 'spec_helper'

describe "foods/edit" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :description => "MyString",
      :upc => "MyString",
      :guiding_star => 1,
      :f2e => "MyString",
      :tab_val => 1
    ))
  end

  it "renders the edit food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", food_path(@food), "post" do
      assert_select "input#food_description[name=?]", "food[description]"
      assert_select "input#food_upc[name=?]", "food[upc]"
      assert_select "input#food_guiding_star[name=?]", "food[guiding_star]"
      assert_select "input#food_f2e[name=?]", "food[f2e]"
      assert_select "input#food_tab_val[name=?]", "food[tab_val]"
    end
  end
end

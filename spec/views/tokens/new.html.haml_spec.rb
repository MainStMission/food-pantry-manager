require 'spec_helper'

describe "tokens/new" do
  before(:each) do
    assign(:token, stub_model(Token,
      :household_id => 1,
      :initial_value => 1,
      :current_value => 1,
      :flavor => "MyString",
      :isexpired => false
    ).as_new_record)
  end

  # it "renders new token form" do
  #   render

  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "form[action=?][method=?]", tokens_path, "post" do
  #     assert_select "input#token_household_id[name=?]", "token[household_id]"
  #     assert_select "input#token_initial_value[name=?]", "token[initial_value]"
  #     assert_select "input#token_current_value[name=?]", "token[current_value]"
  #     assert_select "input#token_flavor[name=?]", "token[flavor]"
  #     assert_select "input#token_isexpired[name=?]", "token[isexpired]"
  #   end
  # end
end
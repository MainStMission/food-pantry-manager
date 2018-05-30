require_relative '../rails_helper'

describe Token do

  it "should have a valid factory" do
    create(:token).should be_valid
  end



end

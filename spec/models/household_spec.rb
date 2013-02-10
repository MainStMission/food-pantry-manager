require 'spec_helper'

describe Household do
  it "has a valid factory" do
     create(:household).should be_valid
  end

  it "should be invalid without a household name" do
     build(:household, household_name: nil).should_not be_valid
  end

   it "should not allow a duplicate household_name" do
     create(:household, household_name: "Brooke")
     expect(build(:household, household_name: "Brooke")).to_not be_valid
   end

  it { should have_many(:neighbors)}

end

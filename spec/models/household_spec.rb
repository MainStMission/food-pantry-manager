require 'spec_helper'

describe Household do

  it { should have_many(:neighbors) }

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

   it "should allow entry of a Family member" do
     build(:household).neighbor.first_name.should == 'Anne'
     end

end

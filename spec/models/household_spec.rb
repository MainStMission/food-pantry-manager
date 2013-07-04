require 'spec_helper'

describe Household do

  it { should have_many(:neighbors) }


  it { should have_many(:visits) }


  # it 'has a valid factory' do
  #   create(:household).should be_valid
  # end

  # it 'should be invalid without a household name' do
  #   create(:household, household_name: nil).should_not be_valid
  # end

  #it 'should not allow a duplicate household_name' do
  #  create(:household, household_name: "Brooke", neighbor_id: 2)
  #  expect(build(:household, household_name: "Brooke", neighbor_id: 3)).to_not be_valid
  #end

  # let(:household)  {
  #    Household.new(
  #     household_name: "Turkey"
  #     )
  #   }
  #   subject(:neighbor) {Neighbor.new(
  #   first_name: "Tom",
  #   last_name: "Turkey")}
  #
  # it "should have one primary neighbor" do
  #
  #   its(:primary_neighbor) {should eq("Turkey")}
  #end
  #


  it 'should allow entry of multiple family members' do

  end

  it 'should return a count of the number of associated neighbors' do

  end

  it 'should return a count of visits' do

  end

end

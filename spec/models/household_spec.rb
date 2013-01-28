# -*- encoding : utf-8 -*-
require_relative '../spec_helper'

describe Household do

  it { should have_many(:neighbors) }

  it 'has a valid factory' do
    FactoryGirl.create(:household, household_name: 'James').should be_valid
  end

  it 'should be invalid without a household_name' do
    #FactoryGirl.build(:household, household_name: nil).should_not be_valid
  end

  it 'should not allow duplicates' do
    FactoryGirl.create(:household, household_name: 'Jess')
    FactoryGirl.build(:household, household_name: 'Jess').should_not be_valid
  end

  it 'should not allow duplicates - make sure ok if different' do
    FactoryGirl.create(:household, household_name: 'Jordan')
    FactoryGirl.build(:household, household_name: 'Brawley').should be_valid
  end

    let(:household) { FactoryGirl.create(:household, household_name: 'Jones') }
    before { @neighbor = household.neighbors.build(last_name: 'Gladwell')}

end

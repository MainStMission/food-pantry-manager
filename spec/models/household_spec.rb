# -*- encoding : utf-8 -*-
require_relative '../spec_helper'

describe Household do

  it { should have_many(:neighbors) }

  it 'has a valid factory' do
    FactoryGirl.create(:household, household_name: 'Jones').should be_valid
  end

  it 'should be invalid without a household_name' do
    #FactoryGirl.build(:household, household_name: nil).should_not be_valid
  end

  it 'should not allow duplicates' do
    FactoryGirl.create(:household, household_name: 'Jones')
    FactoryGirl.build(:household, household_name: 'Jones').should_not be_valid
  end

  it 'should not allow duplicates - make sure ok if different' do
    FactoryGirl.create(:household, household_name: 'Jones')
    FactoryGirl.build(:household, household_name: 'Brooke').should be_valid
  end

  it 'can have a neighbor' do
    FactoryGirl.create(:household, household_name: 'Jones').


  end

end

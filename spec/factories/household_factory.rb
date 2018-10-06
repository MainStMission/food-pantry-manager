# Read about factories at https://github.com/thoughtbot/factory_girl


require 'faker'

FactoryGirl.define do

  # f2e  :neighbor do
  #  name 'Brooke'
  # end


   factory :household do
     household_name 'Brooke, Tom'
     :neighbor
   end


      factory :householdNeighbor do
         after(:create) do |household|
         create(:neighbor, household: household)
       end
     end
  end




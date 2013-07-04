# Read about factories at https://github.com/thoughtbot/factory_girl

require 'factory_girl_rails'

require 'faker'

FactoryGirl.define do

  #factory :neighbor do
  #  name 'Tom Brooke'
  #end


   factory :household do
     household_name 'Brooke, Tom'
     neighbor
   end


      factory :household_with_neighbor do
         after(:create) do |household|
         create(:neighbor, household: household)
       end
     end
  end




# Read about factories at https://github.com/thoughtbot/factory_girl


require 'faker'

FactoryGirl.define do

  # f2e  :neighbor do
  #  name 'Brooke'
  # end
  #

   factory :household do

     trait :neighbor do
       neighbor_id 23
     end

     household_name 'Brooke Tom'
     association :neighbor
   end

  end




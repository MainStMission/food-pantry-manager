# Read about factories at https://github.com/thoughtbot/factory_girl

require 'factory_bot_rails'

require 'faker'

FactoryBot.define do


   factory :household do
     household_name 'Brooke, Tom'
     association :neighbor
   end

   factory :household_with_neighbor do
         after(:create) do |household|
         create(:neighbor, household: household)
       end
   end
   # factory :neighbor do
   #   name 'Tom Brooke'
   # end

  end




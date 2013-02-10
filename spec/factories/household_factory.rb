# Read about factories at https://github.com/thoughtbot/factory_girl


require 'faker'

FactoryGirl.define do 
 factory :household do
    household_name "Brooke"
    neighbor
end

end

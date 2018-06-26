# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :foodline do
    visit_id 21
    food_id 22
    household_id 23
    quantity 250.00
    price 30
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :household do
    factory :household_with_neighbors do
      after_create {|instance| create_list(:neighbor, 3, household:instance)}
    end
  end
end


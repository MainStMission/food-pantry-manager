# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :household do
    person_id 1
    friend_id 1
    relationship "MyString"
  end
end

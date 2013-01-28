# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    last_name "MyString"
    first_name "MyString"
    middle_name "MyString"
    title "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    phone "MyString"
    email "MyString"
    age 1
  end
end

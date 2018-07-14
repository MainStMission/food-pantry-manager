# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :token do
    household_id 1
    issue_date "2018-07-05"
    expiration_date "2018-07-05"
    initial_value 1
    current_value 1
    flavor "MyString"
    isexpired false
  end
end

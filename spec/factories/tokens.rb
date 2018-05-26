# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :token do
    household nil
    quantity 1
    issue_date "2018-05-26 10:49:05"
    expiration_date "2018-05-26 10:49:05"
  end
end

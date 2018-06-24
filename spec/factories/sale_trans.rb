# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale_tran do
    household_id 1
    visit_id 1
    date "2018-06-24"
    tag "MyString"
    weight "9.99"
    tab_val 1
  end
end

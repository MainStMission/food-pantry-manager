# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :tab_tran do
    visit nil
    household nil
    tag "MyString"
    quantity 1
  end
end

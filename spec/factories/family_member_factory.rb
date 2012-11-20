FactoryGirl.define do
  factory :family_member do
    sequence(:name) { |n| "Person #{n}" }
    age 40
    encrypted_ssn 123-33-4556
    neighbor
  end
end

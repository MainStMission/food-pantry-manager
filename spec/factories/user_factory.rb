# -*- encoding : utf-8 -*-
FactoryBot.define do
  factory :user do
    sequence(:email){|n| "test#{n}@example.com"}
    password "password!"
  end
end

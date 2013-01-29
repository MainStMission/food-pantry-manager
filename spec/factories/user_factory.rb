# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "test#{n}@example.com"}
    password "password!"
  end
  factory :admin, :class => :user do
    email "admin_test@example.com"
    first_name "admin"
    last_name "istrator" 
    password "password1"
    password_confirmation "password1"
    access_level_id = AccessLevel.where(["name like ?", "Admin"]).first
  end
end

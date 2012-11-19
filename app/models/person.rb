class Person < ActiveRecord::Base
  has_one :donor
  has_one :neighbor
  has_one :user
  has_one :volunteer
end

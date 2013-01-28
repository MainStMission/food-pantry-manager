class Household < ActiveRecord::Base

  has_many :neighbors

  attr_accessible :friend_id, :person_id, :relationship
end

class Household < ActiveRecord::Base

  belongs_to :person
  belongs_to :relation, :class_name => 'Person'

  attr_accessible :friend_id, :person_id, :relationship
end

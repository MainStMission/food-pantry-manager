class Household < ActiveRecord::Base

  belongs_to :neighbor
  belongs_to :relation, :class_name => 'Neighbor'

  attr_accessible :friend_id, :person_id, :relationship
end

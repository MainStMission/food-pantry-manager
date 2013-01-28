class Household < ActiveRecord::Base

  has_many :neighbors

  attr_accessible
end

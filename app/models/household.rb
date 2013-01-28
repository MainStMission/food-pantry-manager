class Household < ActiveRecord::Base
  # attr_accessible :title, :body

 has_many :neighbors
end

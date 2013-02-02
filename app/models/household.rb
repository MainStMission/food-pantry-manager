class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  # attr_accessible :title, :body

 has_many :neighbors
 accepts_nested_attributes_for :neighbors

  def name
   household_name
  end
end

class Household < ActiveRecord::Base
#  include ActiveModel::ForbiddenAttributesProtection

 has_many :neighbors
 accepts_nested_attributes_for :neighbors

  def name
   household_name
  end


end

class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :neighbors
  attr_accessible :household_name
  accepts_nested_attributes_for :neighbors

  def neighbor_name
    neighbors(:neighbor_id).name
  end
end

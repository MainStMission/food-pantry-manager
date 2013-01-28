class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :neighbors
  attr_accessible :household_name
  accepts_nested_attributes_for :neighbors , :reject_if => :all_blank, :allow_destroy => true

  def neighbor_name
    Neighbor.find(params[:id])
  end
end

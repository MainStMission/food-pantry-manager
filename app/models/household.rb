class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :household_name, presence: true , uniqueness: true

  has_many :neighbors
  attr_accessible :household_name
  accepts_nested_attributes_for :neighbors , :reject_if => :all_blank, :allow_destroy => true

  def add_neighbor
    self.neighbor.name if neighbor
  end


end

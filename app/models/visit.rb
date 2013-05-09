# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  validates :household_id, presence: {message:'You must select a household'}

  belongs_to :neighbor
  belongs_to :household

  delegate :name, to: :neighbor, prefix: true, allow_nil: true
  delegate :household_name, to: :household, prefix: true, allow_nil: true

  has_paper_trail

  def show_neighbor
    neighbor.last_name if neighbor
  end

  def show_household
    household.household_name if household
  end

  def last_visit
    self.visited_on.last

  end
end

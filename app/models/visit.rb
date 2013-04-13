# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :neighbor
  belongs_to :household

  delegate :name, to: :neighbor, prefix: true, allow_nil: true
  delegate :household_name, to: :household, prefix: true, allow_nil: true

  def show_neighbor
    neighbor.last_name if neighbor
  end

  def show_household
    household.household_name if household
  end

end

# -*- encoding : utf-8 -*-
class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

 validates :household_name, presence: {message: 'You must enter a Household name' }
 validates :household_name, uniqueness: true

 has_many :neighbors
 accepts_nested_attributes_for :neighbors, allow_destroy: true, reject_if: :all_blank

end

# -*- encoding : utf-8 -*-
class Household < ActiveRecord::Base
  #include ActiveModel::ForbiddenAttributesProtection

 validates :household_name, presence: {message: 'You must enter a Household name' }
 validates :household_name, uniqueness: true

 has_many :neighbors
 has_many :visits
 accepts_nested_attributes_for :neighbors, allow_destroy: true, reject_if: :all_blank
 accepts_nested_attributes_for :visits, allow_destroy: true, reject_if: :all_blank

 default_scope order('household_name ASC')

  def name
    household_name
  end

  def visit
    self.visits
  end

 def last_visit
   if self.visits.count > 0
     self.visits.last.visited_on.strftime('%B %d')
   else
     'No Visits Yet'
   end



 end

end

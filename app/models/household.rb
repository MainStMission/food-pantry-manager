# -*- encoding : utf-8 -*-
class Household < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :household_name, presence: {message: 'You must enter a Household name'}
  validates :household_name, uniqueness: {message: 'We already have that Household'}
  validates :neighbors, presence: {message: 'You must enter at least one neighbor'}
  validates :inc_amt1, :inc_amt2, :inc_amt3, :exp_amt1, :exp_amt2, :exp_amt3, numericality: true, allow_nil: true

  has_many :neighbors
  has_many :visits
  accepts_nested_attributes_for :neighbors, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :visits, allow_destroy: true, reject_if: :all_blank
  

  # after_save: print_receipt

  has_paper_trail

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

# def print_receipt
#    if @visit?
#      redirect_to: 
#   else
#      redirect_to: households_path
#   end




end



# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  
  # include ActiveModel::ForbiddenAttributesProtection

  validates :household_id, presence: {message:'You must select a household'}
  validates :neighbor, presence: {message: 'You must select a Neighbor'}
  validates :neighbor, associated: {message: 'You must select a Neighbor'}

  belongs_to :neighbor
  belongs_to :household

  has_many :neighbors, through: :households



  delegate :name, to: :neighbor, prefix: true, allow_nil: true
  delegate :household_name, to: :household, prefix: true, allow_nil: true

  default_scope order('visited_on DESC')


  has_paper_trail

  def show_neighbor
    neighbor.last_name if neighbor
  end

  def self.initialize_model
    @model = ' '
  end

  def show_neighbor_name
    neighbor.name if neighbor
  end

  def neighbor_count
    household.neighbors.count if neighbors > 0
  end



 def visit_date
   self.visited_on
 end

 def visit_weight
  self.weight  
 end

  def show_household
    household.household_name if household
  end

  def household_allowance
    household.box_type if household
  end

  def show_neighbor
    neighbor.name if neighbor
  end

  #def self.households_by_month(month)
  #      visits.by_month(month)
  #      where(:household_id => :unique)
  #end

  def self.last_visit
    visited_on.last

  end

  def self.by_month(month)
    where("select(to_char(visited_on, 'FMMonth')) = ?", month)
  end

  #def unique_household
  #  by_month.household_id.unigue
  #end

end

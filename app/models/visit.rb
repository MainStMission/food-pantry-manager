# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  

  include ActiveModel::ForbiddenAttributesProtection


  validates :household_id, presence: {message:'You must select a household'}
  validates :neighbor, presence: {message: 'You must select a Neighbor'}
  validates :neighbor, associated: {message: 'You must select a Neighbor'}

  belongs_to :neighbor
  belongs_to :household
  has_many   :foodlines
  belongs_to :token

  has_many :foods, through: :foodlines


  accepts_nested_attributes_for :foodlines, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :foods,  reject_if: :all_blank

  delegate :name, to: :neighbor, prefix: true, allow_nil: true
  delegate :household_name, to: :household, prefix: true, allow_nil: true

  default_scope order('visited_on DESC')
  scope :harvest_visits, -> { where('visited_on >= ?', 3.months.ago )}
  by_star_field :visited_on

  scope :visit_list, -> { where('visited_on >= ?', 2.weeks.ago) }
  scope :open, -> { where(istab:true, isopen: true)}
  scope :closed, -> { where(istab: true, isopen: false)}

  has_paper_trail

  def self.visit_open
    visits.isopen?
  end

  def checkout

  end

  def self.show_neighbor
    neighbor.last_name if neighbor
  end

  # Uses by_star gem for dates https://github.com/radar/by_star

  def  self.visits_current_month
    harvest_visits.by_month(Date.today.strftime("%B")).count
  end

# Use the following: Household.where(:id => @hi).map(&:neighbor_count).inject(:+)
  def self.households_current_month_count
    harvest_visits.by_month(Date.today.strftime("%B")).pluck(:household_id).uniq.count
  end

  def self.households_current_month
    harvest_visits.by_month(Date.today.strftime("%B")).pluck(:household_id).uniq
  end

  def self.households_current_month_count
    harvest_visits.by_month(Date.today.strftime("%B")).pluck(:household_id).uniq.count
  end

  def self.visits_past_month
    harvest_visits.past_month.count
  end

  def self.households_past_month
    harvest_visits.past_month.pluck(:household_id).uniq
  end

  def self.households_past_month_count
    harvest_visits.past_month.pluck(:household_id).uniq.count
  end

  def self.neighbors_current_month
    households_current_month.map{|id| Household.find(id).neighbor_count}.inject(:+)
  end

  def self.neighbors_past_month
    households_past_month.map{|id| Household.find(id).neighbor_count}.inject(:+)
  end
  
  # Move to households 
  # @household_ids.map{|id| Household.find(id).young_neighbor}.inject(:+)



  def self.initialize_model
    @model = ' '
  end

  def show_neighbor_name
    neighbor.name if neighbor
  end

  def self.neighbor_count
    household.neighbors.count if neighbors > 0
  end



  def visit_date
   self.visited_on
  end

  def visit_weight
    self.weight  
  end

  def visit_tab?
    istab
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


  def self.last_visit
    visited_on.last

  end

  private




end

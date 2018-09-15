# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  

  include ActiveModel::ForbiddenAttributesProtection


  validates :household_id, presence: {message:'You must select a household'}
  validates :neighbor, presence: {message: 'You must select a Neighbor'}
  validates :neighbor, associated: {message: 'You must select a Neighbor'}
  validates :token, presence: {message: 'You must have a Token to shop'}
  validates_uniqueness_of :household_id, scope: :isopen, message: 'Yon can not have more than one open cart'

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
  scope :harvest_visits, -> { where('visited_on >= ?', 4.months.ago )}
  scope :harvest_visits_last_month, -> { where('visited_on  >= ? AND visited_on <=  ?', 1.month.ago.beginning_of_month, 1.month.ago.end_of_month)}
  scope :harvest_visits_two_months_ago, -> { where('visited_on >= ? AND visited_on <= ?', 2.months.ago.beginning_of_month, 2.months.ago.end_of_month)}
  scope :harvest_visits_current_month, -> { where('visited_on >= ? AND visited_on <= ?', Time.now.beginning_of_month, Time.now.end_of_month)}

  scope :visit_list, -> { where('visited_on >= ?', 2.weeks.ago) }
  scope :open, -> { where(istab:true,   isopen: true)}
  scope :closed, -> { where(istab: true, isopen: false)}


  has_paper_trail

  def self.visit_open
    visit.isopen?
  end

  def checkout

  end

  def self.current_month
    harvest_visits_current_month.count
  end

  def self.households_current_month 
        harvest_visits_current_month.uniq_by(&:household_id)
  end

  def self.households_count_current_month
    harvest_visits_current_month.uniq_by(&:household_id).count
  end

  def self.neighbors_current_month
    harvest_visits_current_month.uniq_by(&:household_id).map(&:household_id).map{|id| Household.find(id).neighbor_count}.reduce(:+)
  end

  def self.last_month
    harvest_visits_last_month.count
  end

  def self.households_last_month 
       harvest_visits_last_month.uniq_by(&:household_id)
  end

  def self.households_count_last_month
    households_last_month.count
  end

  def self.neighbors_last_month
   households_last_month.map(&:household_id).map{|id| Household.find(id).neighbor_count}.reduce(:+)
 end

  def self.households_two_months_ago 
    harvest_visits_two_months_ago.uniq_by(&:household_id)
  end

  def self.households_count_two_months_ago
    harvest_visits_two_months_ago.uniq_by(&:household_id).count
  end

  def self.neighbors_two_months_ago
   households_two_months_ago.map(&:household_id).map{|id| Household.find(id).neighbor_count}.reduce(:+)
 end
 
 def self.two_months_ago
    harvest_visits_two_months_ago.count
  end

  def self.young_neighbors_current_month
    households_current_month.map(&:household_id).map{|id| Household.find(id).young_neighbor}.reduce(:+)
  end

  def self.middle_neighbors_current_month
    households_current_month.map(&:household_id).map{|id| Household.find(id).middle_neighbor}.reduce(:+)
  end

  def self.old_neighbors_current_month
    households_current_month.map(&:household_id).map{|id| Household.find(id).old_neighbor}.reduce(:+)
  end

  def self.young_neighbors_last_month
    households_last_month.map(&:household_id).map{|id| Household.find(id).young_neighbor}.reduce(:+)
  end

  def self.middle_neighbors_last_month
    households_last_month.map(&:household_id).map{|id| Household.find(id).middle_neighbor}.reduce(:+)
  end

  def self.old_neighbors_last_month
    households_last_month.map(&:household_id).map{|id| Household.find(id).old_neighbor}.reduce(:+)
  end


  def self.young_neighbors_two_month
    households_two_months_ago.map(&:household_id).map{|id| Household.find(id).young_neighbor}.reduce(:+)
  end

  def self.middle_neighbors_two_month
    households_two_months_ago.map(&:household_id).map{|id| Household.find(id).middle_neighbor}.reduce(:+)
  end

  def self.old_neighbors_two_month
    households_two_months_ago.map(&:household_id).map{|id| Household.find(id).old_neighbor}.reduce(:+)
  end

  # def self.households_last_month 
  #      harvest_visits_last_month.uniq_by(&:household_id).count
  # end  

  def self.show_neighbor
    neighbor.last_name if neighbor
  end  
   




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

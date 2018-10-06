class Token < ActiveRecord::Base
  
  include ActiveModel::ForbiddenAttributesProtection

  validates :issue_date, presence: {message: 'You must enter an Issue Date'}
  validates :expiration_date, presence: {message: 'You must enter an Expiration Date'}
  validates :initial_value, presence: {message: 'You must enter a Value for this Token'}

  # validates :household_id, uniqueness: {scope: :open, message: 'Open Token already exists'}

  belongs_to  :household
  has_many    :visits

  default_scope order('issue_date DESC')

  scope :open_tok, -> { where('? BETWEEN DATE(issue_date) AND DATE(expiration_date)', Date.today) }
  scope :expired_tok, -> { where('DATE(expiration_date) < ?', Date.today) }
  has_paper_trail
  
  max_paginates_per 20

  def visit
    self.visits
  end


  # def self tabs_spent
  #   @visits.map(&:tab).compact.sum
  # end

  # def self tab_balance
  #   @intial_balance - tabs_spent
  # end

end

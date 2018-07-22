class Token < ActiveRecord::Base
  
  include ActiveModel::ForbiddenAttributesProtection

  validates :issue_date, presence: {message: 'You must enter an Issue Date'}
  validates :expiration_date, presence: {message: 'You must enter an Expiration Date'}
  validates :initial_value, presence: {message: 'You must enter a Value for this Token'}

  belongs_to  :household
  has_many    :visits

  has_paper_trail

  def visit
    self.visits
  end


  def expired?
      expiration_date < Date.today
  end

  # def self tabs_spent
  #   @visits.map(&:tab).compact.sum
  # end

  # def self tab_balance
  #   @intial_balance - tabs_spent
  # end

end

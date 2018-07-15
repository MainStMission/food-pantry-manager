class Token < ActiveRecord::Base
  
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to  :household
  has_many    :visits

  has_paper_trail

  def visit
    self.visits
  end


  def expired?
      expiration_date > Date.today
  end

  # def self tabs_spent
  #   @visits.map(&:tab).compact.sum
  # end

  # def self tab_balance
  #   @intial_balance - tabs_spent
  # end

end

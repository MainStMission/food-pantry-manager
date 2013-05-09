# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  
 # include ActiveModel::ForbiddenAttributesProtection

  validates :first_name, presence: {message: 'Neighbor must have a first name' }
  validates :last_name, presence: {message: 'Neighbor must have a last name' }

  has_many :visits

  belongs_to :household

  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  has_paper_trail

  def name
    [first_name, last_name].join " "
  end

  def house_name
    household.household_name if household
  end

  def last_visit
    visit.visited_on.last if visit
  end

  def age
    if
    dob = birth_date
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    else
      'add Date'
    end

  end

end

# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  
 # include ActiveModel::ForbiddenAttributesProtection

  has_many :visits

  belongs_to :household

  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  def name
    [first_name, last_name].join " "
  end

  def house_name
    household.household_name if household
  end



  def set_rank

  end

end

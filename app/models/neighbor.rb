# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  
 # include ActiveModel::ForbiddenAttributesProtection

  validates :email, :uniqueness  =>true 
  has_many :visits

  belongs_to :household

  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  def name
    [first_name, last_name].join " "
  end


  def set_rank

  end

end

# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :neighbor
  has_many :visits

  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  def name
    "#{first_name} #{last_name}"
  end
end

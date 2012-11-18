# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  has_many :family_members
  def name
    "#{first_name} #{last_name}"
  end
end

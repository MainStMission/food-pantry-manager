# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  has_many :visits

  belongs_to :household

  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def household_name
    household.name if household
  end

end

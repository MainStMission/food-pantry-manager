# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  #Validations

  validates :last_name, presence: true , length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }



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

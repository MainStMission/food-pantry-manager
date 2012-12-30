# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  

  include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :first_name , :last_name, :spouse
  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  has_many :family_members
  accepts_nested_attributes_for :family_members

  
  def name
    "#{first_name} #{last_name}"
  end
end

# -*- encoding : utf-8 -*-
class Neighbor < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  has_many :visits

  has_many :households
  has_many :relations, :through => :households
  has_many :inverse_relationships, :class_name => 'Household', :foreign_key => 'friend_id'
  has_many :inverse_relations, :through => :inverse_relationships, :source => :person


  attr_encrypted :ssn, :key => Rails.application.config.secret_token

  def name
    "#{first_name} #{last_name}"
  end
end

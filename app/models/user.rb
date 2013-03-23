# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  attr_accessor :token

  def name
    [first_name, last_name].join(' ')
  end

  def name_with_email
    if name.blank?
      email
    else
      "#{name} (#{email})"
    end
  end

  def super_volunteer?
    @access_level_id >= AccessLevel.super_volunteer
  end
  
  def admin?
    @access_level_id == AccessLevel.admin
  end
end

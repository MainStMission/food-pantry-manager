# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :admin, :login

  attr_accessor :login

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :authentication_keys => [:login]

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

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end

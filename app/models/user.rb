# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :admin

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

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
end

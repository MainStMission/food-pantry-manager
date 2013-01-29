# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  attr_accessor :token
  before_create :generate_token

  def generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while User.where(:token => token).exists?
    self.token = token
  end

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

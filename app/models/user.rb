# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  def name
    [first_name, last_name].join(' ')
  end
end

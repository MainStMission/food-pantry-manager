# -*- encoding : utf-8 -*-
class Volunteer < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :time_cards

  def name
    "#{first_name} #{last_name}"
  end

  def sign_in
    TimeCard.clock_in(self)
  end

  def sign_out
    TimeCard.clock_out(self)
  end

  def signed_in?
    TimeCard.signed_in?(self)
  end

  def sign_in_time
    TimeCard.sign_in_time(self)
  end
end

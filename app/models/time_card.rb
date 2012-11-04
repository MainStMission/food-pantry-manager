# -*- encoding : utf-8 -*-
class TimeCard < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  def self.clock_in(volunteer, clock=DateTime)
    create(volunteer_id: volunteer.id, start_time: clock.now)
  end

  def self.clock_out(volunteer, clock=DateTime)
    where(volunteer_id: volunteer.id, end_time: nil)
      .update_all(end_time: clock.now)
  end

  def self.signed_in?(volunteer)
    where(volunteer_id: volunteer.id, end_time: nil).any?
  end

  def self.sign_in_time(volunteer)
    if signed_in?(volunteer)
      where(volunteer_id: volunteer.id, end_time: nil).first.start_time
    end
  end
end

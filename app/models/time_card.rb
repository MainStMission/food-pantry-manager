# -*- encoding : utf-8 -*-
NotSignedInTime = Object.new
class << NotSignedInTime
  def to_s
    "<TimeCard: Not signed in>"
  end
end

class TimeCard < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  def self.clock_in(volunteer, clock=DateTime)
    unless signed_in?(volunteer)
      create(volunteer_id: volunteer.id, start_time: clock.now)
    end
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
    else
      NotSignedInTime
    end
  end
end

class TimeCard < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :volunteer_id

  def self.clock_in(volunteer, clock=Time)
    create(volunteer_id: volunteer.id, start_time: clock.now)
  end

  def self.clock_out(volunteer, clock=Time)
    where(volunteer_id: volunteer.id, end_time: nil).update_all(end_time: clock.now)
  end

  def self.volunteer_signed_in?(volunteer)
    where(volunteer_id: volunteer.id, end_time: nil).any?
  end

  def self.sign_in_time(volunteer)
    if volunteer_signed_in?(volunteer)
      where(volunteer_id: volunteer.id, end_time: nil).first.start_time
    end
  end

end

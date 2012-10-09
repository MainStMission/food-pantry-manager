class TimeCard < ActiveRecord::Base

  def self.clock_in(volunteer, clock=Time)
    create(volunteer_id: volunteer.id, start_time: clock.now)
  end

  def self.clock_out(volunteer, clock=Time)
    where(volunteer_id: volunteer.id, end_time: nil).update_all(end_time: clock.now)
  end

  def self.volunteer_signed_in?(volunteer)
    where(volunteer_id: volunteer.id, end_time: nil).any?
  end

end

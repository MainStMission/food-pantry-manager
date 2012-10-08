require 'active_record_spec_helper'
require_relative '../../app/models/time_card'


describe TimeCard do
  before(:all) do
    Clock = OpenStruct.new(now: Time.now)
    Volunteer = Struct.new(:id)
  end

  describe ".clock_in" do
    it "creates a timecard for a volunteer" do
      expect{ TimeCard.clock_in(Volunteer.new(1))}.to change { TimeCard.count }.by(1)
    end

    it "sets the start_time to the current time" do
      time_card = TimeCard.clock_in(Volunteer.new(1), Clock)
      time_card.start_time.should == Clock.now
    end
  end

  describe ".clock_out" do
    it "sets the end_time to the current time" do
      volunteer = Volunteer.new(1)
      time_card = TimeCard.clock_in(volunteer, Clock)
      TimeCard.clock_out(volunteer, Clock)
      time_card.reload.end_time.should == Clock.now
    end
  end

end


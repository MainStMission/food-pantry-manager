require 'active_record_spec_helper'
require_relative '../../app/models/time_card'


describe TimeCard do
  before(:all) do
    Clock = OpenStruct.new(now: Time.now)
    volunteer = double 'Volunteer'
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

  describe ".volunteer_signed_in?" do
    let(:volunteer) { Volunteer.new(1) }
    it "returns true if a volunteer hasn't clocked out of a time card" do
      TimeCard.clock_in(volunteer)
      TimeCard.volunteer_signed_in?(volunteer).should be_true
    end

    it "returns false if a volunteer hasn't clocked out of a time card" do
      TimeCard.volunteer_signed_in?(volunteer).should be_false
    end
  end

end


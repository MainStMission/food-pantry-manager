require "active_record_spec_helper"
require "timecop"

require_relative "../../app/models/time_card"
require_relative "../../app/models/volunteer"

describe TimeCard do
  let(:volunteer) { stub_model Volunteer, :id => 1 }

  before do
    Timecop.freeze(DateTime.now)
  end

  after do
    Timecop.return
  end

  describe ".clock_in" do
    it "creates a timecard for a volunteer" do
      expect{ TimeCard.clock_in(Volunteer.new)}.to change { TimeCard.count }.by(1)
    end

    it "sets the start_time to the current time" do
      time_card = TimeCard.clock_in(Volunteer.new, DateTime)
      time_card.start_time.should == DateTime.now
    end
  end

  describe ".clock_out" do
    it "sets the end_time to the current time" do
      volunteer = Volunteer.new
      time_card = TimeCard.clock_in(volunteer, DateTime)
      TimeCard.clock_out(volunteer, DateTime)
      time_card.reload.end_time.should == DateTime.now
    end
  end

  describe ".sign_in_time" do
    it "gets the sign in time" do
      TimeCard.clock_in(volunteer, DateTime)
      TimeCard.sign_in_time(volunteer).should == DateTime.now
    end
  end

  describe ".signed_in?" do
    let(:signin_volunteer) { Volunteer.new }
    it "returns true if a volunteer hasn't clocked out of a time card" do
      TimeCard.clock_in(signin_volunteer)
      TimeCard.signed_in?(signin_volunteer).should be_true
    end

  end

end

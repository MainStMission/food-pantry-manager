# -*- encoding : utf-8 -*-
require_relative "../spec_helper"
require "timecop"

describe TimeCard do
  let(:volunteer) { FactoryGirl.create(:volunteer) }

  before do
    Timecop.freeze(DateTime.now)
  end

  after do
    Timecop.return
  end

  describe ".clock_in" do
    it "creates a timecard for a volunteer" do
      expect{TimeCard.clock_in(volunteer)}.to change{TimeCard.count}.by(1)
    end

    it "sets the start_time to the current time" do
      time_card  = TimeCard.clock_in(volunteer)
      start_time = time_card.start_time

      expect(start_time).to eq(DateTime.now)
    end
  end

  describe ".clock_out" do
    it "sets the end_time to the current time" do
      time_card = TimeCard.clock_in(volunteer)
      TimeCard.clock_out(volunteer)
      time_card.reload

      expect(time_card.end_time).to eq(DateTime.now)
    end
  end

  describe ".sign_in_time" do
    it "gets the sign in time" do
      TimeCard.clock_in(volunteer)
      sign_in_time = TimeCard.sign_in_time(volunteer)

      expect(sign_in_time).to eq(DateTime.now)
    end
  end

  describe ".signed_in?" do
    it "returns true if a volunteer hasn't clocked out of a time card" do
      TimeCard.clock_in(volunteer)
      signed_in = TimeCard.signed_in?(volunteer)

      expect(signed_in).to be_true
    end
  end
end

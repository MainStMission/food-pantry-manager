# -*- encoding : utf-8 -*-
require_relative "../spec_helper"
require_relative "../../app/models/volunteer"
require_relative "../../app/models/time_card"

describe Volunteer do
  let(:volunteer) { Volunteer.create!(first_name: "Kermit", last_name: "Frog") }

  describe "#name" do
    it "combines the first and last name" do
      volunteer.name.should == "Kermit Frog"
    end
  end

  describe "#sign_in" do
    it "creates a time card with start_time set to current time" do
      TimeCard.should_receive(:clock_in)
      volunteer.sign_in
    end
  end

  describe "#sign_in" do
    it "creates a time card with start_time set to current time" do
      TimeCard.should_receive(:clock_out)
      volunteer.sign_out
    end
  end

  describe "#signed_in?" do
    it "asks TimeCard if signed in" do
      volunteer.sign_in
      TimeCard.should_receive(:signed_in?)
      volunteer.signed_in?
    end
  end

  describe "#sign_in_time" do
    it "asks TimeCard for the sign in time" do
      volunteer.sign_in
      TimeCard.should_receive(:sign_in_time)
      volunteer.sign_in_time
    end
  end
end

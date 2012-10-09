require 'active_record_spec_helper'
require_relative '../../app/models/volunteer'
require_relative '../../app/models/time_card'


describe Volunteer do
  let(:volunteer) { Volunteer.create!(first_name: 'Kermit', last_name: 'Frog') }

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

  describe "#signed_in?" do
    it "asks TimeCard if signed in" do
      volunteer.sign_in
      TimeCard.should_receive(:volunteer_signed_in?)
      volunteer.signed_in?
    end
  end
end

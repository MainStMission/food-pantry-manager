# -*- encoding : utf-8 -*-
require_relative "../rails_helper"
require "timecop"

describe Volunteer do
  subject(:volunteer) {
    FactoryBot.create(:volunteer, first_name: "Kermit", last_name: "Frog")
  }
  let(:now) { DateTime.now }

  before do
    Timecop.freeze(DateTime.now)
  end

  after do
    Timecop.return
  end

  it {is_expected.to have_attributes(name:  a_string_matching("Kermit Frog")) }

  specify "#sign_in signs in a volunteer with the current time" do
    time_card = volunteer.sign_in
    expect(time_card.start_time).to eq(now)
  end

  specify "#sign_out signs out a volunteer with the current time" do
    volunteer.sign_out
    expect(volunteer).to_not be_signed_in
  end

  describe "#signed_in?" do
    specify "returns false when a volunteer isn't signed in" do
      expect(volunteer).to_not be_signed_in
    end

    specify "returns true when a volunteer is signed in" do
      volunteer.sign_in
      expect(volunteer).to be_signed_in
    end
  end

  describe "#sign_in_time" do
    specify "returns time a volunteer signed in if they have" do
      volunteer.sign_in
      expect(volunteer.sign_in_time).to eq(now)
    end

    specify "returns NotSignedInTime if a volunteer hasn't signed in" do
      expect(volunteer.sign_in_time).to eq(NotSignedInTime)
    end
  end
end

describe NotSignedInTime do
  it "prints a helpful message" do
    NotSignedInTime.to_s.should match(/not signed in/i)
  end
end


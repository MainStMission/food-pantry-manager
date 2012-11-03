# -*- encoding : utf-8 -*-
require 'active_record_spec_helper'
require_relative '../../app/models/donation'
require_relative '../../app/models/donor'

describe Donation do

  describe "#donor_name" do 
    it "returns the donor's name" do
      subject.donor = Donor.new(name: "ME")
      subject.donor.should_receive(:name)
      subject.donor_name
    end
  end

end

# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe Donation do

  it { should belong_to(:donor) }


  subject(:donation) { FactoryGirl.create(:donation) }

  describe "#donor_name" do 
    let!(:donor) { donation.donor }

    its(:donor_name) { should eq(donor.name) }
  end
end

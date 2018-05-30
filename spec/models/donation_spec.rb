# -*- encoding : utf-8 -*-
require_relative "../rails_helper"

describe Donation do
  subject(:donation) { FactoryGirl.create(:donation) }

  describe "#donor_name" do 
    let!(:donor) { donation.donor }

    its(:donor_name) { should eq(donor.name) }
  end
end

# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe FamilyMember do
  subject(:family_member) { FactoryGirl.create(:family_member) }

  describe "#neighbor_name" do 
    let!(:neighbor) { family_member.neighbor }

    its(:neighbor_name) { should eq(neighbor.name) }
  end
end

# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

SSN = '123-45-6789'

describe Neighbor do

  ## Quick Shoulda test for the relation

  # it {should belongs_to(:household)}

  ## Shanes SSN testing

  context 'ssn' do
    let(:neighbor) do
      Neighbor.new.tap do |n|
        n.first_name = 'Sam'
        n.last_name = 'May'
        n.ssn = SSN
        n.save
      end
    end

    it "should be encrypted" do
      neighbor_id = neighbor.id
      neighbor = Neighbor.find_by_id(neighbor_id)

      neighbor.ssn.should == SSN
      neighbor.encrypted_ssn.should_not == SSN
    end

    it "should be salted" do
      another_neighbor = Neighbor.new
      another_neighbor.ssn = SSN

      neighbor.encrypted_ssn.should_not == another_neighbor.encrypted_ssn
    end

    ### Let's go with factories
    ##

    it "should have a valid factory" do
      create(:neighbor).should be_valid
    end

    it "Returns a neighbors full name as a string" do
      create(:neighbor, first_name: "Tom", last_name:"Brooke").name.should == "Tom Brooke"
    end
  end
end

# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

SSN = '123-45-6789'

describe Neighbor do
  context 'ssn' do
    let(:neighbor) do
      Neighbor.new.tap do |n|
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
  end
end

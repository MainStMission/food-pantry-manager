# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe NeighborsController do
  describe "#neighbor" do
    let(:neighbor) { FactoryGirl.create(:neighbor) }

    it "finds the neighbor with an id" do
      controller.params[:id] = neighbor.id
      controller.neighbor.should == neighbor
    end

    context "no volunteer" do
      it "initializes a new neighbor" do
        controller.neighbor.should be_new_record
      end
    end
  end
end

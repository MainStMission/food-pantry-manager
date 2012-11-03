# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe NeighborsController do
  let!(:neighbor) { FactoryGirl.create(:neighbor) }

  describe "#neighbor" do
    it "finds the neighbor with an id" do
      controller.params[:id] = neighbor.id
      expect(controller.neighbor).to eq(neighbor)
    end

    context "no volunteer" do
      it "initializes a new neighbor" do
        expect(controller.neighbor).to be_new_record
      end
    end
  end
end

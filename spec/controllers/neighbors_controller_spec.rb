# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe NeighborsController do
  let!(:neighbor) { FactoryGirl.create(:neighbor) }

  describe "Creates a new neighbor" do
    it "creates a neighbor" do
      expect {
        post :create, {neighbor: {first_name: "tom", last_name: "Brooke"}}
      }.to change {Neighbor.count}.by(1)
    end
  end

  describe "Update neighbor" do
      it "updates the requested neighbor" do
        put :update, {id: neighbor.to_param, neighbor: {first_name: "tom"}}
        neighbor.reload
        expect(neighbor.first_name).to eq("tom")
      end
   end

  describe "Destroy a neighbor" do
    it "destroys a neighbor" do
      expect {
        delete :destroy, {id: neighbor.to_param}
      }.to change { Neighbor.count }.by(-1)
    end
  end
end

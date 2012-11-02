require 'spec_helper'

describe NeighborsController do

  def valid_attributes
    { :first_name => "Tom",
      :last_name => "Terrific" }
  end

  describe "#neighbor" do
    let!(:neighbor) { Neighbor.create! valid_attributes }

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

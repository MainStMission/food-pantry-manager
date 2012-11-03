# -*- encoding : utf-8 -*-
require 'spec_helper'

describe DonorsController do
  def valid_attributes
    { :name => "A generous neighbor" }
  end

  describe "#donor" do
    let!(:donor) { Donor.create! valid_attributes }

    it "finds the donor with an id" do
      controller.params[:id] = donor.id
      controller.donor.should == donor
    end

    context "no volunteer" do
      it "initializes a new donor" do
        controller.donor.should be_new_record
      end
    end
  end

  describe "#donors" do
    let!(:donor) { Donor.create! valid_attributes }

    it "returns all donors" do
      controller.donors.should == [donor]
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new donor" do
        expect { post :create, { :donor => valid_attributes}}.to change(Donor, :count).by(1)
      end

      it "redirects to the donor index" do
        post :create, {:donor => valid_attributes}
        response.should redirect_to(donors_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        Donor.any_instance.stub(:save).and_return(false)
        post :create, {:donor => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested donor" do
        donor = Donor.create! valid_attributes
        Donor.any_instance.should_receive(:attributes=).with({'name' => 'params'})
        put :update, {:id => donor.to_param, :donor => {'name' => 'params'}}
      end

      it "redirects to the donor index" do
        donor = Donor.create! valid_attributes
        put :update, {:id => donor.to_param, :donor => valid_attributes}
        response.should redirect_to(donors_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        donor = Donor.create! valid_attributes
        Donor.any_instance.stub(:save).and_return(false)
        put :update, {:id => donor.to_param, :donor => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested donor" do
      donor = Donor.create! valid_attributes
      expect {
        delete :destroy, {:id => donor.to_param}
      }.to change(Donor, :count).by(-1)
    end

    it "redirects to the donors list" do
      donor = Donor.create! valid_attributes
      delete :destroy, {:id => donor.to_param}
      response.should redirect_to(donors_url)
    end
  end
end

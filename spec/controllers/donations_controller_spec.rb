# -*- encoding : utf-8 -*-
require 'spec_helper'

describe DonationsController do
  def valid_attributes
    { :weight => "55.65", :donor_id => "1" }
  end

  describe "#donation" do
    let!(:donation) { Donation.create! valid_attributes }

    it "finds the donation with an id" do
      controller.params[:id] = donation.id
      controller.donation.should == donation
    end

    context "no donation" do
      it "initializes a new donation" do
        controller.donation.should be_new_record
      end
    end

  end

  describe "#donations" do
    let!(:donation) { Donation.create! valid_attributes }

    it "returns all donations" do
      controller.donations.should == [donation]
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new donation" do
        expect { post :create, { :donation => valid_attributes}}.to change(Donation, :count).by(1)
      end

      it "redirects to the donation index" do
        post :create, {:donation => valid_attributes}
        response.should redirect_to(donations_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        Donation.any_instance.stub(:save).and_return(false)
        post :create, {:donation => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested donation" do
        donation = Donation.create! valid_attributes
        Donation.any_instance.should_receive(:attributes=).with({'weight' => '55.2'})
        put :update, {:id => donation.to_param, :donation => {'weight' => '55.2'}}
      end

      it "redirects to the donation index" do
        donation = Donation.create! valid_attributes
        put :update, {:id => donation.to_param, :donation => valid_attributes}
        response.should redirect_to(donations_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        donation = Donation.create! valid_attributes
        Donation.any_instance.stub(:save).and_return(false)
        put :update, {:id => donation.to_param, :donation => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested donation" do
      donation = Donation.create! valid_attributes
      expect {
        delete :destroy, {:id => donation.to_param}
      }.to change(Donation, :count).by(-1)
    end

    it "redirects to the donations list" do
      donation = Donation.create! valid_attributes
      delete :destroy, {:id => donation.to_param}
      response.should redirect_to(donations_url)
    end
 
  end
end

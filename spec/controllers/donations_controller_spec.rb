# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe DonationsController do
  let!(:donation) { FactoryGirl.create(:donation) }

  describe "#donation" do
    it "finds the donation with an id" do
      controller.params[:id] = donation.id
      expect(controller.donation).to eq(donation)
    end

    context "no donation" do
      it "initializes a new donation" do
        expect(controller.donation).to be_new_record
      end
    end
  end

  describe "#donations" do
    it "returns all donations" do
      expect(controller.donations).to eq([donation])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new donation" do
        expect{
          post :create, {donation: {}}
        }.to change{Donation.count}.by(1)
      end

      it "redirects to the donation index" do
        post :create, {donation: {}}
        expect(response).to redirect_to(donations_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        pending "until you have invalid params you can't test this"
        post :create, {donation: {}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested donation" do
        weight = "55.2"
        put :update, {id: donation.to_param, donation: {weight: weight}}
        donation.reload

        expect(donation.weight).to eq(BigDecimal(weight))
      end

      it "redirects to the donation index" do
        put :update, {id: donation.to_param, donation: {weight: "55.2"}}
        expect(response).to redirect_to(donations_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        pending "until you have invalid params you can't test this"
        put :update, {id: donation.to_param, donation: {}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested donation" do
      expect {
        delete :destroy, {id: donation.to_param}
      }.to change{Donation.count}.by(-1)
    end

    it "redirects to the donations list" do
      delete :destroy, {id: donation.to_param}
      expect(response).to redirect_to(donations_url)
    end
  end
end

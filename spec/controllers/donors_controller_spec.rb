# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe DonorsController do
  let!(:donor) { FactoryGirl.create(:donor) }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new donor" do
        expect{
          post :create, {donor: {name: "bob"}}
        }.to change{Donor.count}.by(1)
      end

      it "redirects to the donor index" do
        post :create, {donor: {name: "bob"}}
        expect(response).to redirect_to(new_donation_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        skip "until you have invalid params you can't test this"
        post :create, {:donor => {}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested donor" do
        put :update, {id: donor.to_param, donor: {name: "bob yost"}}
        donor.reload

        expect(donor.name).to eq("bob yost")
      end

      it "redirects to the donor index" do
        put :update, {id: donor.to_param, donor: {name: "bob"}}
        expect(response).to redirect_to(donors_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        skip "until you have invalid params you can't test this"
        put :update, {id: donor.to_param, donor: {}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested donor" do
      expect {
        delete :destroy, {id: donor.to_param}
      }.to change{Donor.count}.by(-1)
    end

    it "redirects to the donors list" do
      delete :destroy, {id: donor.to_param}
      expect(response).to redirect_to(donors_url)
    end
  end
end

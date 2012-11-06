# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe DonorsController do
  let!(:donor) { FactoryGirl.create(:donor) }

  describe "#donor" do
    it "finds the donor with an id" do
      controller.params[:id] = donor.id
      expect(controller.donor).to eq(donor)
    end

    context "no volunteer" do
      it "initializes a new donor" do
        expect(controller.donor).to be_new_record
      end
    end
  end

  describe "#donors" do
    it "returns all donors" do
      expect(controller.donors).to eq([donor])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new donor" do
        expect{
          post :create, {donor: {name: "bob"}}
        }.to change{Donor.count}.by(1)
      end

      it "redirects to the donor index" do
        post :create, {donor: {name: "bob"}}
        expect(response).to redirect_to(donors_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        pending "until you have invalid params you can't test this"
        post :create, {:donor => {}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested donor" do
        put :update, {id: donor.to_param, donor: {name: "bob"}}
        donor.reload

        expect(donor.name).to eq("bob")
      end

      it "redirects to the donor index" do
        put :update, {id: donor.to_param, donor: {name: "bob"}}
        expect(response).to redirect_to(donors_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        pending "until you have invalid params you can't test this"
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

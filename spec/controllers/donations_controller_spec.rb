# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe DonationsController do
	let!(:donation) { FactoryGirl.create(:donation) }

	before(:each) do
    request.env["HTTP_REFERER"] = 'http://localhost:3000/donations/new'
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new donation" do
				expect{
					post :create, {donation: {weight: 10}}
				}.to change{Donation.count}.by(1)
			end

		end

		describe "with invalid params" do
			it "re-renders the 'new' template" do
					post :create, {donation: {weight: ' '}}
				expect(response).to render_template("new")
			end
		end
	end

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested donation" do
				weight = 55.2
				put :update, {id: donation.to_param, donation: {weight: weight}}
				donation.reload

				expect(donation.weight).to eq(Float(weight))
			end


		end

		describe "with invalid params" do
			it "re-renders the 'edit' template" do
				put :update, {id: donation.to_param, donation: {weight: ' '}}
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

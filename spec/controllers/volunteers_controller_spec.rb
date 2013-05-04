# -*- encoding : utf-8 -*-
require_relative "../spec_helper"



describe VolunteersController do
  let!(:volunteer) { FactoryGirl.create(:volunteer) }

  describe "GET sign_in" do
    it "signs in the volunteer" do
      get :sign_in, {id: volunteer.to_param}
      expect(response).to redirect_to(time_clock_path)
    end
  end

  describe "GET sign_out" do
    it "signs out the volunteer" do
      get :sign_out, {id: volunteer.to_param}
      expect(response).to redirect_to(time_clock_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Volunteer" do
        expect {
          post :create, {volunteer: {first_name: "bob"}}
        }.to change{Volunteer.count}.by(1)
      end

    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        pending "until you have invalid params you can't test this"
        post :create, {volunteer: {}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested volunteer" do
        put :update, {id: volunteer.to_param, volunteer: {first_name: "bob"}}
        volunteer.reload

        expect(volunteer.first_name).to eq("bob")
      end

      it "redirects to the volunteers list" do
        put :update, {id: volunteer.to_param, volunteer: {first_name: "bob"}}
        expect(response).to redirect_to(volunteers_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        pending "until you have invalid params you can't test this"
        put :update, {id: volunteer.to_param, volunteer: {}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested volunteer" do
      expect {
        delete :destroy, {id: volunteer.to_param}
      }.to change{Volunteer.count}.by(-1)
    end

    it "redirects to the volunteers list" do
      delete :destroy, {id: volunteer.to_param}
      expect(response).to redirect_to(volunteers_url)
    end
  end
end

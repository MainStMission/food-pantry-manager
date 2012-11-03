# -*- encoding : utf-8 -*-
require 'spec_helper'

describe VolunteersController do
  def valid_attributes
    {:first_name => "Kermit",
     :last_name => "Frog",
     :email => "kermit@sesamestreet.org",
     :phone => "555-1111",
     :street => "555 Sesame St",
     :city => "New York",
     :state => "NY",
     :zip => "44444",
     :status => "Active"}
  end
  
  def valid_session
    {}
  end

  describe "#volunteer" do
    context "given a volunteer exists" do
      let!(:vol) { Volunteer.create! valid_attributes }

      it "finds the volunteer with an id" do
        controller.params[:id] = vol.id
        controller.volunteer.should == vol
      end
    end

    context "no volunteer" do
      it "initializes a new volunteer" do
        controller.volunteer.should be_new_record
      end
    end
  end

  describe "#volunteers" do
    it "returns all of the volunteers" do
      volunteer = Volunteer.create! valid_attributes
      controller.volunteers.should == [volunteer]
    end
  end

  describe "GET sign_in" do
    it "signs in the volunteer" do
      volunteer = Volunteer.create! valid_attributes
      Volunteer.any_instance.should_receive(:sign_in)
      get :sign_in, {:id => volunteer.to_param}, valid_session
      response.should redirect_to(time_clock_path)
    end
  end

  describe "GET sign_out" do
    it "signs out the volunteer" do
      volunteer = Volunteer.create! valid_attributes
      Volunteer.any_instance.should_receive(:sign_out)
      get :sign_out, {:id => volunteer.to_param}, valid_session
      response.should redirect_to(time_clock_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Volunteer" do
        expect {
          post :create, {:volunteer => valid_attributes}, valid_session
        }.to change(Volunteer, :count).by(1)
      end

      it "redirects to the created volunteer" do
        post :create, {:volunteer => valid_attributes}, valid_session
        response.should redirect_to(Volunteer.last)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Volunteer.any_instance.stub(:save).and_return(false)
        post :create, {:volunteer => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      # Assuming there are no other volunteers in the database, this
      # specifies that the Volunteer created on the previous line
      # receives the :update_attributes message with whatever params are
      # submitted in the request.
      it "updates the requested volunteer" do
        volunteer = Volunteer.create! valid_attributes
        Volunteer.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => volunteer.to_param, :volunteer => {'these' => 'params'}}, valid_session
      end

      it "redirects to the volunteer" do
        volunteer = Volunteer.create! valid_attributes
        put :update, {:id => volunteer.to_param, :volunteer => valid_attributes}, valid_session
        response.should redirect_to(volunteer)
      end
    end

    describe "with invalid params" do
      # Trigger the behavior that occurs when invalid params are submitted
      it "re-renders the 'edit' template" do
        volunteer = Volunteer.create! valid_attributes
        Volunteer.any_instance.stub(:save).and_return(false)
        put :update, {:id => volunteer.to_param, :volunteer => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested volunteer" do
      volunteer = Volunteer.create! valid_attributes
      expect {
        delete :destroy, {:id => volunteer.to_param}, valid_session
      }.to change(Volunteer, :count).by(-1)
    end

    it "redirects to the volunteers list" do
      volunteer = Volunteer.create! valid_attributes
      delete :destroy, {:id => volunteer.to_param}, valid_session
      response.should redirect_to(volunteers_url)
    end
  end
end

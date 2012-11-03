# -*- encoding : utf-8 -*-
require "spec_helper"

describe VolunteersController do
  describe "routing" do

    it "routes to #index" do
      get("/volunteers").should route_to("volunteers#index")
    end

    it "routes to #new" do
      get("/volunteers/new").should route_to("volunteers#new")
    end

    it "routes to #show" do
      get("/volunteers/1").should route_to("volunteers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/volunteers/1/edit").should route_to("volunteers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/volunteers").should route_to("volunteers#create")
    end

    it "routes to #update" do
      put("/volunteers/1").should route_to("volunteers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/volunteers/1").should route_to("volunteers#destroy", :id => "1")
    end

    it "routes to #sign_in" do
      get("/volunteers/1/sign_in").should route_to("volunteers#sign_in", :id => "1")
    end

    it "routes to #sign_out" do
      get("/volunteers/1/sign_out").should route_to("volunteers#sign_out", :id => "1")
    end
  end
end

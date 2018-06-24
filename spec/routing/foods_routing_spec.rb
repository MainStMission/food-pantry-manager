require "spec_helper"

describe FoodsController do
  describe "routing" do

    it "routes to #index" do
      get("/foods").should route_to("foods#index")
    end

    it "routes to #new" do
      get("/foods/new").should route_to("foods#new")
    end

    it "routes to #show" do
      get("/foods/1").should route_to("foods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/foods/1/edit").should route_to("foods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/foods").should route_to("foods#create")
    end

    it "routes to #update" do
      put("/foods/1").should route_to("foods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/foods/1").should route_to("foods#destroy", :id => "1")
    end

  end
end

 -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe VolunteersController do
  describe "routing" do
    it "routes to #sign_in" do
      route = get("/volunteers/1/sign_in")
      expect(route).to route_to("volunteers#sign_in", id: "1")
    end

    it "routes to #sign_out" do
      route = get("/volunteers/1/sign_out")
      expect(route).to route_to("volunteers#sign_out", id: "1")
    end
  end
end

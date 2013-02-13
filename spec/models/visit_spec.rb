# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe Visit do
  let(:neighbor)  {
    Neighbor.new(
      first_name: "Tom", last_name: "Turkey"
    )
  }
  subject(:visit) { Visit.new(neighbor: neighbor) }

  its(:neighbor_name) { should eq("Tom Turkey") }
end

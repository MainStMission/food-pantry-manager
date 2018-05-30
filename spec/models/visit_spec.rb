# -*- encoding : utf-8 -*-
require_relative "../rails_helper"

describe Visit do
  let(:neighbor)  {
    Neighbor.new(
      first_name: "Tom", last_name: "Turkey"
    )
  }
  subject(:visit) { Visit.new(neighbor: neighbor) }

  its(:neighbor_name) { should eq("Tom Turkey") }
end

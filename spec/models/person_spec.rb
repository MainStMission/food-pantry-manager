require 'spec_helper'

describe Person do
  it { should have_many(:relations).through(:households) }
  it { should have_many(:inverse_relations).through(:inverse_relationships)}
end


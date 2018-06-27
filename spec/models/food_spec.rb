require 'spec_helper'

describe Food do

  it { should have_many(:foodlines) }
  it { should have_many(:households).through :foodlines }
end

# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe Donor do
    
  it { should have_many(:donations) }
end

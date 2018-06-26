require 'spec_helper'

describe Foodline do

 
  it { should belong_to(:food) }
  it { should belong_to(:household) }
  it { should belong_to(:visit) }

end

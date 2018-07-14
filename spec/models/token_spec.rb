require 'spec_helper'



describe Token do

  it { should have_many(:visits) }
  it { should belong_to(:household) }

end

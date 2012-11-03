# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do

  describe "#name" do

    it "combines the first name and last name" do
      user = User.new
      user.stub(:first_name).and_return("Kermit")
      user.stub(:last_name).and_return("Frog")

      user.name.should == "Kermit Frog"
    end

  end

end

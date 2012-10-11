require 'spec_helper'

describe Customer do

  describe "#name" do

     it "combines the first name and last name" do
       customer = Customer.new
       customer.stub(:cust_first_name).and_return("Kermit")
       customer.stub(:cust_last_name).and_return("Frog")

       customer.name.should == "Kermit Frog"
     end

   end


end

# -*- encoding : utf-8 -*-
require_relative "../spec_helper"

describe FamilyMember do

 let(:neighbor) { FactoryGirl.create(:neighbor) }
 before { @family_member = neighbor.family_members.build(name:"Tom Harding")  } 
 
 subject{ @family_member }
 it {should respond_to(:name)}
 it {should respond_to(:neighbor_id)}
 its(:neighbor) {should == neighbor}

 it {should be_valid}
end

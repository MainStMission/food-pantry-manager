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

##describe "when neighbor_id is not present" do
      #before { @family_member.neighbor_id = nil }
          #it { should_not be_valid }
            #end

 #describe "accesible attributes" do
   #it "should not allow access to neighbor_id" do
     #expect do
       #FamilyMember.new(neighbor_id: neighbor.id)
     #end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
   #end

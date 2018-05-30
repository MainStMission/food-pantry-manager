# -*- encoding : utf-8 -*-
require_relative "../rails_helper"

describe User do
  subject(:user) {
    FactoryGirl.create(:user, first_name: "Kermit", last_name: "Frog")
  }

  its(:name) { should eq("Kermit Frog") }
end

require_relative '../rails_helper'

describe HouseholdsController do
  describe "GET #index" do
        it "populates an array of Households"
        it "renders the :index view"
  end

  describe "GET #show" do
     it "assigns the requested contact to @household"
     it "renders the :show template"
   end

    describe "GET #new" do
      it "assigns a new Contact to @household"
      it "renders the :new template"
    end

    describe "POST #create" do
      context "with valid attributes" do
      it "saves the new contact in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
     end
   end
 end


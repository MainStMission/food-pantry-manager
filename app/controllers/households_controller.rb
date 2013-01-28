class HouseholdsController < ApplicationController

  def create
   @relationship = current_person.relationships.build(:person_id  => params[:relation_id])
    if @relationship.save
      flash[:notice] = 'Added to Household'
      redirect_to root_url
    else
     flash[:error] = 'Unable to add to Household'
     redirect_to root_url
    end
  end

  def destroy
    @relationship = current_person.relationships.build(:person_id  => params[:relation_id])
    @relationship.destroy
   flash[notice] = 'Removed from Household'
   redirect_to current_person 
  end

end

class HouseholdsController < ApplicationController

  expose(:household)
  expose(:households)

  def create
    if household.save
      redirect_to households_path, notice: "Household was successfully created."
    else
      render action "new"
    end
  end

  def update
    if household.save
      redirect_to households_path, notice: "Household was successfully updated."
    else
      render action "edit"
    end
  end

  def destroy
    household.destroy

    redirect_to households_path, notice: "Household deleted."
  end

  private

  def allowable
    [
        :household_name, :neighbor_id
    ]
  end

  def household_params
    params.require(:household).permit(*allowable)
  end
end


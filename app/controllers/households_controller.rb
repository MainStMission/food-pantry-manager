class HouseholdsController < ApplicationController

  expose(:household)
  expose(:households)
  expose(:neighbors)
  expose(:neighbor)

  def create
    if household.save
      redirect_to households_path, notice: "Household was successfully created."
    else
      render "new"
    end
  end

  def update
    if household.save
      redirect_to households_path, notice: "Household was successfully updated."
    else
      render "edit"
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


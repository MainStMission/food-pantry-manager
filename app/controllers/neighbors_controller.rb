# -*- encoding : utf-8 -*-
class NeighborsController < ApplicationController
  expose(:neighbor)
  expose(:neighbors)
  

  def create
    if neighbor.save
      redirect_to neighbors_path, notice: 'Neighbor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if neighbor.save
      redirect_to neighbors_path, notice: 'Neighbor was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    neighbor.destroy

    redirect_to neighbors_path
  end

  private

  def allowable
    [
      :city, :close_date, :date_of_proof, :first_name,
      :food_stamps, :last_name, :monthly_income, :notes, :number_of_children,
      :open_date, :phone, :proof_of_residency_type, :rent, :residency_date,
      :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
      :utilities, :zip ,:created_at, :updated_at, :family_member_attributes
    ]
  end

  def neighbor_params
    params.require(:neighbor).permit(*allowable)
  end
end

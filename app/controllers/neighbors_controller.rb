# -*- encoding : utf-8 -*-
class NeighborsController < ApplicationController

  expose(:neighbor)
  expose(:neighbors)

  def create
    if neighbor.save
      redirect_to :back, notice: 'Neighbor was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if neighbor.save
      redirect_to neighbors_path, notice: 'Neighbor was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    neighbor.destroy

    redirect_to neighbors_path, notice: 'Neighbor deleted.'
  end



  private

  def allowable
    [
      :city, :close_date, :date_of_proof, :first_name, :middle_name,  :street,
      :food_stamps, :last_name, :monthly_income, :notes, :number_of_children,
      :open_date, :phone, :proof_of_residency_type, :email, :rent, :residency_date,
      :proof_of_residency_type, :smokes, :spouse, :ssn, :encrypted_ssn, :state, :street,
      :utilities, :zip ,:created_at, :updated_at , :neighbors_attributes
    ]
  end

  def neighbor_params
    params.require(:neighbor).permit(*allowable)
  end
end

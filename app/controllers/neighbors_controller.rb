# -*- encoding : utf-8 -*-
class NeighborsController < ApplicationController
  helper_method :neighbor, :neighbors

  def edit
    @neighbor = Neighbor.find(params[:id])
  end

  def create
    neighbor.attributes = neighbor_params

    if neighbor.save
      redirect_to neighbors_path, notice: 'Neighbor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    neighbor.attributes = neighbor_params
     
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

  def neighbor
    @neighbor ||= params[:id] ? Neighbor.find(params[:id]) : Neighbor.new
  end

  def neighbors
    @cache_neighbors ||= Neighbor.all
  end

  private

  def allowable
    [
      :city, :close_date, :date_of_proof, :first_name,
      :food_stamps, :last_name, :monthly_income, :notes, :number_of_children,
      :open_date, :phone, :proof_of_residency_type, :rent, :residency_date,
      :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
      :utilities, :zip ,:created_at, :updated_at
    ]
  end

  def neighbor_params
    params.require(:neighbor).permit(*allowable)
  end

end

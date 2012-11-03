# -*- encoding : utf-8 -*-
class NeighborsController < ApplicationController
  helper_method :neighbor, :neighbors

  def edit
    @neighbor = Neighbor.find(params[:id])
  end

  def create
    assign_attributes

    if neighbor.save
      redirect_to neighbors_path, notice: 'Neighbor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    assign_attributes
    
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
    @neighbor ||= params[:id] ? Neighbor.find(params[:id]) : Neighbor.new(params[:neighbor])
  end

  def neighbors
    @cache_neighbors ||= Neighbor.all
  end

  def assign_attributes
    neighbor.attributes = neighbor_params.except(:ssn)
    neighbor.ssn = neighbor_params[:ssn]
  end

  def neighbor_params
    params[:neighbor]
  end

end

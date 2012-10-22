class NeighborsController < ApplicationController

   helper_method :neighbor, :neighbors

  def edit
    @neighbor = Neighbor.find(params[:id])
  end


  def create
    neighbor.attributes = params[:neighbor]

    if neighbor.save
      redirect_to neighbors_path, notice: 'Neighbor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    neighbor.attributes = params[:neighbor]

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
    @cache_neighbor ||= Neighbor.find_or_initialize_by_id(params[:id])
  end

  def neighbors
    @cache_neighbors ||= Neighbor.all
  end
end


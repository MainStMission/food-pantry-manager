# -*- encoding : utf-8 -*-
class VisitsController < ApplicationController
  expose(:visit)
  expose(:visits)
  expose(:household)
  expose(:households)
  helper_method :visit, :visits

  def create
    if visit.save
      redirect_to visits_path, notice: 'Visit was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if visit.save
      redirect_to visits_path, notice: 'Visit was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    visit.destroy

    redirect_to visits_path
  end

  private

  def allowable
    [
      :household_id, :neighbor_id, :visited_on, :items_received, :notes
    ]
  end

  def visit_params
    params.require(:visit).permit(*allowable)
  end
end

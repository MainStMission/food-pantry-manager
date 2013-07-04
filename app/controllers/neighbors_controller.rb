# -*- encoding : utf-8 -*-
class NeighborsController < ApplicationController

  before_filter :authenticate_user!
  expose(:household)
  expose(:households)
  expose(:neighbor)
  expose(:neighbors) { Neighbor.scoped.page params[:page] }

  def create
    if neighbor.save
      redirect_to :back, notice: 'Neighbor was successfully created.'
    else
      render 'new'
    end
  end

  def index
    @young_neighbors = Neighbor.young
    @middle_neighbors = Neighbor.middle
    @old_neighbors = Neighbor.old


      @q = Neighbor.search(params[:q])
      @neighbors = @q.result(:distinct => true)

  end


  def update
    if neighbor.update_attributes(params[neighbor])
      @household = neighbor.household
      redirect_to edit_household_path(@household), notice: 'Neighbor was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    neighbor.destroy

    redirect_to households_path, notice: 'Neighbor deleted.'
  end

  def edit
    - session[:return_to] ||= request.referer
  end

  private

  def allowable
    [
      :city, :close_date, :date_of_proof, :first_name, :middle_name,  :street,
      :food_stamps, :last_name, :monthly_income, :notes, :number_of_children,
      :open_date, :phone, :proof_of_residency_type, :email, :rent, :residency_date,
      :proof_of_residency_type, :smokes, :spouse, :ssn, :encrypted_ssn, :state, :street,
      :utilities, :zip ,:created_at, :sex, :apt, :updated_at ,:birth_date, :neighbors_attributes
    ]
  end

  def neighbor_params
    params.require(:neighbor).permit(*allowable)
  end
end

# -*- encoding : utf-8 -*-
class NeighborsController < ApplicationController
  expose(:neighbor)
  expose(:neighbors)
  before_filter :authenticate_user!, :current_user
  before_filter :has_access?, :only => [:create, :update, :destroy]

  # GET /neighbors
  # GET /neighbors.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: neighbors }
    end
  end

  # GET /neighbors/1
  # GET /neighbors/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: neighbor }
    end
  end

  # GET /neighbors/new
  # GET /neighbors/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: neighbor }
    end
  end

  def update
    if neighbor.update_attributes(safe_params)
      redirect_to neighbor, notice: t('households.controller.update.success')
    else
      render :edit
    end
  end

  # POST /neighbors
  # POST /neighbors.json
  def create
    respond_to do |format|
      if neighbor.save
        format.html { redirect_to neighbor, notice: 'Neighbor was successfully created.' }
        format.json { render json: neighbor, status: :created, location: neighbor }
      else
        format.html { render action: "new" }
        format.json { render json: neighbor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    unless neighbor.destroy
      flash[:error] = t('users.controller.destroy.prevent_self_destroy')
    end
    redirect_to neighbors_url
  end

  private

  def has_access?
    current_user.admin?
  end

  def allowable
    [
      :city, :close_date, :date_of_proof, :first_name, :middle_name,  :street,
      :food_stamps, :last_name, :monthly_income, :notes, :number_of_children,
      :open_date, :phone, :proof_of_residency_type, :rent, :residency_date,
      :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
      :utilities, :zip ,:created_at, :updated_at , :neighbors_attributes
    ]
  end

  def safe_params
    params.require(:neighbor).permit(*allowable)
  end
end

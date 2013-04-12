# -*- encoding : utf-8 -*-
class VisitsController < ApplicationController
  #expose(:visit)
  #expose(:visits)
  #helper_method :visit, :visits


  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @visits = Household.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visits = Visit.new
    @visits.neighbors.build
    @visits.neighbors.first.house_rank = 0
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /visits/1/edit
  def edit
    @visits = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.json


  def update
    @visits = Visit.find(params[:id])

    if @visits.update_attributes(safe_params)
      redirect_to @visits, notice: t('visits.controller.update.success')
    else
      render :edit
    end
  end


  def create
    @visits = Visit.new(safe_params)

    respond_to do |format|
      if @visits.save
        format.html { redirect_to @visits, notice: 'visits was successfully created.' }
        format.json { render json: @visits, status: :created, location: @visits }
      else
        format.html { render action: "new" }
        format.json { render json: @visits.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @visits = Visit.find(params[:id])

    if  @visits.destroy
    else
      flash[:error] = t('users.controller.destroy.prevent_self_destroy')
    end
    redirect_to visits_url

  end


  private

  def allowable
    [


        :neighbor_id, :visited_on, :items_received, :notes,
        households_attributes: [

        :household_name, :name], neighbors_attributes: [
        :city, :close_date, :date_of_proof, :first_name, :middle_name, :street, :apt,
        :food_stamps, :last_name, :monthly_income, :notes, :house_rank,
        :open_date, :phone, :proof_of_residency_type, :email, :sex, :rent, :residency_date,
        :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
        :utilities, :zip, :age, :created_at, :updated_at, :neighbors_attributes, :encrypted_ssn
    ]
    ]
  end

  def safe_params
    params.require(:visits).permit(*allowable)
  end

end














#  def create
#    if visit.save
#      redirect_to visits_path, notice: 'Visit was successfully created.'
#    else
#      render action: "new"
#    end
#  end
#
#  def update
#    if visit.save
#      redirect_to visits_path, notice: 'Visit was successfully updated.'
#    else
#      render action: "edit"
#    end
#  end
#
#  def destroy
#    visit.destroy
#
#    redirect_to visits_path
#  end
#
#  private
#
#  def allowable
#    [
#      :neighbor_id, :visited_on, :items_received, :notes
#    ]
#  end
#
#  def visit_params
#    params.require(:visit).permit(*allowable)
#  end
#end

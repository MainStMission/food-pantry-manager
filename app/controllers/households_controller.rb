class HouseholdsController < ApplicationController


  # GET /households
  # GET /households.json
  def index
    @households = Household.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @households }
    end
  end

  # GET /households/1
  # GET /households/1.json
  def show
    @household = Household.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @household }
    end
  end

  # GET /households/new
  # GET /households/new.json
  def new
    @household = Household.new
    @household.neighbors.build
    @household.neighbors.first.house_rank = 0
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @household }
    end
  end

  # GET /households/1/edit
  def edit
    @household = Household.find(params[:id])
  end

  # POST /households
  # POST /households.json


  def update
    @household = Household.find(params[:id])

    if @household.update_attributes(safe_params)
      redirect_to @household, notice: t('households.controller.update.success')
    else
      render :edit
    end
  end


  def create
    @household = Household.new(safe_params)

    respond_to do |format|
      if @household.save
        format.html { redirect_to @household, notice: 'household was successfully created.' }
        format.json { render json: @household, status: :created, location: @household }
      else
        format.html { render action: "new" }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @household = Household.find(params[:id])

      if  @household.destroy
    else
      flash[:error] = t('users.controller.destroy.prevent_self_destroy')
    end
    redirect_to households_url

  end


    private

    def allowable
      [
          :household_name, :name, :neighbors_attributes
      ]
    end

    def safe_params
      params.require(:household).permit(*allowable)
    end

  end

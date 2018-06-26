class FoodlinesController < ApplicationController

    def index
        @foodlines = Foodlines.all
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @foodlines }
    end
  end

  # GET /foodlines/1
  # GET /foodlines/1.json
  def show
    @foodline = Foodline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foodline }
    end
  end

  # GET /foodines/new
  # GET /foodlines/new.json
  def new
    @food = Foodline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foodline }
    end
  end

  # GET /foodlines/1/edit
  def edit
    @foodline = Foodline.find(params[:id])
  end

  # POST /foodlines
  # POST /foodlines.json
  def create
    @foodline = Foodline.new(foodline_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @foodline, notice: 'Food Line was successfully created.' }
        format.json { render json: @foodline, status: :created, location: @foodline }
      else
        format.html { render action: "new" }
        format.json { render json: @foodline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foodlines/1
  # PATCH/PUT /foodlines/1.json
  def update
    @food = Foodline.find(params[:id])

    respond_to do |format|
      if @food.update_attributes(foodline_params)
        format.html { redirect_to @foodline, notice: 'Food line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foodlines/1
  # DELETE /foodlines/1.json
  def destroy
    @food = Foodline.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foodlines_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.

    def food_params
      params.require(:food).permit(:visit_id, :food_id, :household_id, :quantity, :price)
    end
    
end

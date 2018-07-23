class TokensController < ApplicationController

  include RestfulJson::DefaultController

  # GET /tokens
  # GET /tokens.json
  def index
    @tokens = Token.open?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tokens }
    end
  end

  # GET /tokens/1
  # GET /tokens/1.json
  def show
    @token = Token.find(params[:id])
    @household = Household.find(params[:household_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @token }
    end
  end

  # GET /tokens/new
  # GET /tokens/new.json
  def new
    @token = Token.new
    @household = Household.find(params[:household_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @token }
    end
  end

  # GET /tokens/1/edit
  def edit
    @token = Token.find(params[:id])
    @household = Household.find(params[:household_id])

    respond_to do |format|
      format.html
      format.json
    end
  end

  # POST /tokens
  # POST /tokens.json
  def create
    @token = Token.new(token_params)
    @household = @token.household_id

    respond_to do |format|
      if @token.save
        format.html { redirect_to household_path(@household), notice: 'Token was successfully created.' }
        format.json { render json: @token, status: :created, location: @token }
      else
        format.html { render action: "new" }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tokens/1
  # PATCH/PUT /tokens/1.json
  def update
    @token = Token.find(params[:id])

    respond_to do |format|
      if @token.update_attributes(token_params)
        format.html { redirect_to @token, notice: 'Token was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokens/1
  # DELETE /tokens/1.json
  def destroy
    @token = Token.find(params[:id])
    @token.destroy

    respond_to do |format|
      format.html { redirect_to tokens_url }
      format.json { head :no_content }
    end
  end

  private

  def allowable

    [
      :household_id, :issue_date, :expiration_date, :initial_value, 
      :current_value, :flavor, :isexpired
    ]
  end

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def token_params
      params.require(:token).permit(:current_value, :expiration_date, :flavor, :household_id, :initial_value, :isexpired, :issue_date)
    end
end

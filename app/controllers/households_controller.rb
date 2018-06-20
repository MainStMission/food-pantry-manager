class HouseholdsController < ApplicationController

  include RestfulJson::DefaultController

  #respond_to :html, :json

  before_filter :authenticate_user!

  expose(:households) { Household.scoped.includes(:neighbors, :visits).page params[:page] }
  expose(:household, strategy: StrongParametersStrategy)
  expose(:neighbors) { household.neighbors.includes(:visits) }
  expose(:neighbor)
  expose(:visits) { household.visits}
  expose(:visit)


  #def index
  #  respond_with households
  #end


  def index

      @q = Household.includes(:neighbors, :visits).search(params[:q])
        @households = @q.result

  end

  
  def new_visit
    @q = Household.search(params[:q])
    @households = @q.result
  end

  def print_order

    
  end


  def create
    if household.save
      redirect_to households_path, notice: 'Households was successfully created'
    else
      render 'new'
    end
  end

  def neighbors
    neighbors
  end

  def update

    if household.save
      if params[:commit] == 'Print Order'
        @household = household
        @visit = household.visits.last
        redirect_to household_visit_path(@household, @visit)
      elsif params[:commit] == 'Print Receipt'
        @household = household
        @visit = household.visits.last
        redirect_to household_visit_path(@household, @visit)
      else
      redirect_to households_path, notice: 'Household was successfully updated.'
    end
    else
      render 'edit'
    end
  end

def submit
  render :json => 'success'
end
  
  def show
    respond_to do |format|
      format.html
      format.json { render json: household }
      format.pdf do
        pdf = VisitPdf.new(household)
        send_data pdf.render, filename: "visit_#{household.id}.pdf",
             type: "application/pdf",
             disposition: "inline"
      end
    end
  end

  def household_summary
    render json: household_summary
  end


  def harvest
    respond_with households
  end

  def destroy
    household.destroy

    redirect_to households_path, notice: 'Household deleted.'
  end

  def visits_count(month)
    visits.where.("strftime('%m', visited_on) + 0 = ?", month ).count
  end

  private

  def allowable
    [
        :household_name, :name, :box_type, :income1, :income2, :income3, :inc_amt1, :inc_amt2,
        :inc_amt3, :expense1, :expense2, :expense3, :exp_amt1, :exp_amt2, :exp_amt3, :exp_amt4, :expense4, 
        :option1, :option2, :opt_val1, :opt_val2, :notes, :street, :apt, :state, :city, :zip,
        :food_alert, :prayer_request, :money_notes, :special_needs, :how_heard,
        :proof_of_residency_type, :date_of_proof, :post_prayer, :post_needs, :christmas,
        :bool1, :bool_val1, :bool2, :bool_val2, :bool3, :bool_val3, :bool4, :bool_val4,
        :bool5, :bool_val5, :s_numb, :s_box, :income4, :inc_amt4,
        neighbors_attributes: [
        :city, :close_date, :date_of_proof, :first_name, :middle_name, :street, :apt,
        :food_stamps, :last_name, :monthly_income, :notes, :house_rank, :birth_date,
        :open_date, :phone, :proof_of_residency_type, :email, :sex, :rent, :residency_date,
        :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
        :utilities, :zip, :age, :created_at, :updated_at, :neighbors_attributes, :encrypted_ssn
    ],
    visits_attributes: [
        :cereal, :starch, :option1, :option2, :optionb, :visited_on, :items_received, :notes,
        :household_id, :neighbor_id, :tab, :weight, :istab
    ]
    ]
  end

  def household_params
    params.require(:household).permit(*allowable)
  end

end

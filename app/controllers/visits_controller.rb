# -*- encoding : utf-8 -*-
class VisitsController < ApplicationController

  include RestfulJson::DefaultController

  before_filter :authenticate_user!

  # expose(:visit)
  # expose(:visits)
  expose(:household)
  expose(:households)
  expose(:neighbors)
  expose(:foodlines)

  helper_method :visit, :visits

  def create
    if visit.save
      # redirect_to visits_path, notice: 'Visit was successfully created.'
    else
      render action: "new"
    end
  end

def verify
    @visit = Visit.find(params[:id])
    respond_with visit.verify
    redirect_to 'open_visit'
end

  def index
    @visits = Visit.harvest_visits

    respond_to do |format|
      format.html 
      format.json { render json: @foods }
    end
  end


  def new
    @visit = Visit.new
  end


  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(visit_params)
        format.html { render 'visits/verify'}
        # format.html { redirect_to visits_path, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    visit.destroy
    redirect_to visits_path
  end

  def harvest
      @visits = Visit.harvest_visits

      respond_to do |format|
          format.html {render template: 'visits/harvest'}
          format.pdf do
            pdf = TabPdf.new(@visit)
            send_data pdf.render, filename: "visit_#{@visit.id}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
        end
      end
  end

  def checkout
    @visit = Visit.find(params[:visit_id])

      respond_to do |format|
          format.html {render template: 'visits/checkout'}
          format.pdf do
            pdf = TabPdf.new(@visit)
            send_data pdf.render, filename: "visit_#{@visit.id}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
        end
      end
  end

  def show
    @visit = Visit.find(params[:id])
        respond_to do |format|
        format.html  
        format.pdf do
            pdf = TabPdf.new(@visit)
          send_data pdf.render, filename: "visit_#{@visit.id}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
        end
      end
  end

def self.visits_count(month)
  where("extract(month from visited_on) = ?", month).count
end


  private

  def allowable
    [
      :cereal, :starch, :option1, :option2, :optionb, :visited_on, :items_received,
       :notes, :household_id, :neighbor_id, :weight, :tab, :istab, :isopen, :token_id,

      foodlines_attributes:
       [ :visit_id, :food_id, :household_id, :quantity, :price, :description,
        :healthy
      ],
      token_attributes: 
      [:token_id, :isexpired, :issue_date, :initial_value, :current_value ] 
    ]
  end


  def visit_params
    params.require(:visit).permit(*allowable)
  end
  

end

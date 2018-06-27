# -*- encoding : utf-8 -*-
class VisitsController < ApplicationController

  include RestfulJson::DefaultController

  before_filter :authenticate_user!

  expose(:visit)
  expose(:visits)
  expose(:household)
  expose(:households)
  expose(:neighbors)
  expose(:foodlines)

  helper_method :visit, :visits

  def create
    if visit.save
      redirect_to visits_path, notice: 'Visit was successfully created.'
    else
      render action: "new"
    end
  end
  #
  def index
   visits.all
  end


  # def index

  #     @q = Visit.includes(:neighbors, :households).search(params[:q])
  #       @households = @q.result

  # end

  # def new
  #   @visit = Visit.new
  # end

  def update
    if visit.update_attributes(params[visit])
      redirect_to visits_path, notice: 'Visit was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    visit.destroy

    redirect_to visits_path
  end

  def checkout
    redirect_to 'checkout'
  end


  def show
    respond_to do |format|
      format.html
      format.pdf do
          if  pdf = TabPdf.new(visit)
          else
            pdf = TabPdf.new(visit)
          end
          send_data pdf.render, filename: "visit_#{visit.id}.pdf",
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
       :notes, :household_id, :neighbor_id, :weight, :tab, :istab, :isopen

    ]
  end

  # def household_params
  #     params.require(:household).permit!
  #   end

  def visit_params
    params.require(:visit).permit(*allowable)
  end
  

end

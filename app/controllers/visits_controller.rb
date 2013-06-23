# -*- encoding : utf-8 -*-
class VisitsController < ApplicationController

  before_filter :authenticate_user!

  expose(:visit)
  expose(:visits)
  expose(:household)
  expose(:households)
  expose(:neighbors)
  helper_method :visit, :visits

  def create
    if visit.save
      redirect_to visits_path, notice: 'Visit was successfully created.'
    else
      render action: "new"
    end
  end

  def index
    visits.all
  end

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

  def show
    visit = Visit.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = VisitPdf.new(visit)
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
      :cereal, :starch, :option1, :option2, :optionb, :visited_on, :items_received, :notes, :household_id, :neighbor_id
      


    ]
  end

  # def household_params
  #     params.require(:household).permit!
  #   end

  def visit_params
    params.require(:visit).permit(*allowable)
  end
  

end

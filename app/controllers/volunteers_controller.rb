# -*- encoding : utf-8 -*-
class VolunteersController < ApplicationController
  
  helper_method :volunteer, :volunteers


  def create
    volunteer.attributes = params[:volunteer]

    if volunteer.save
      redirect_to volunteer, notice: 'Volunteer was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if volunteer.update_attributes(params[:volunteer])
      redirect_to volunteer, notice: 'Volunteer was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    volunteer.destroy

    redirect_to volunteers_url
  end

  def sign_in
    volunteer.sign_in

    redirect_to time_clock_path
  end

  def sign_out
    volunteer.sign_out

    redirect_to time_clock_path
  end

  def volunteer
    @cache_voluteer ||= Volunteer.find_or_initialize_by_id(params[:id])
  end
  
  def volunteers
    Volunteer.all
  end

end

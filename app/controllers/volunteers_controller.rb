# -*- encoding : utf-8 -*-
class VolunteersController < ApplicationController
  helper_method :volunteer, :volunteers

  def create
    if volunteer.save
      redirect_to volunteer, notice: 'Volunteer was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if volunteer.update_attributes(volunteer_params)
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
    @voluteer ||= params[:id] ? Volunteer.find(params[:id]) : Volunteer.new(volunteer_params)
  end

  def volunteers
    @volunteers ||= Volunteer.all
  end

  private

  def allowable
    [ 
      :city, :email, :first_name, :last_name, :phone, :state,
      :status, :street, :zip
    ]
  end

  def volunteer_params 
    params.require(:volunteer).permit(*allowable)
  end
end

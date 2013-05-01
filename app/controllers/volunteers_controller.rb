# -*- encoding : utf-8 -*-
class VolunteersController < ApplicationController
  expose(:volunteer)
  expose(:volunteers)

  def create
    if volunteer.save
      redirect_to volunteers_path, notice: 'Volunteer was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if volunteer.save
      redirect_to volunteers_path, notice: 'Volunteer was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    volunteer.destroy

    redirect_to volunteers_url
  end

  def sign_in
    if volunteer.sign_in
      redirect_to time_clock_path
    else
      redirect_to time_clock_path, :notice  => "Already signed in."
    end
  end

  def sign_out
    volunteer.sign_out

    redirect_to time_clock_path
  end

  private

  def allowable
    [ 
      :city, :email, :first_name, :last_name, :phone, :state,
      :status, :street, :zip, :group, :birthday, :notes, :cell_phone, :nick_name, :skills, :contact,
      :admin
    ]
  end

  def volunteer_params 
    params.require(:volunteer).permit(*allowable)
  end
end

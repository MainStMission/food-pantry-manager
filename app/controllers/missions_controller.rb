# -*- encoding : utf-8 -*-
class MissionsController < ApplicationController
  expose(:mission)
  expose(:missions)
  before_filter :authenticate_user!

  def create
    if mission.save
      redirect_to users_path, :notice => "Visit Note successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if mission.save
      redirect_to users_path, :notice => "Successfully updated the user."
    else
      render :edit
    end
  end

  private

  def allowable
    [
      :mission_visit_note, :mission_visit_note_title
    ]
  end

  def user_params
    params.require(:mission).permit(*allowable)
  end
end

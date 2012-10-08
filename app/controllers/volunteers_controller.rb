class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def new
    @volunteer = Volunteer.new
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def create
    @volunteer = Volunteer.new(params[:volunteer])

    if @volunteer.save
      redirect_to @volunteer, notice: 'Volunteer was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @volunteer = Volunteer.find(params[:id])

    if @volunteer.update_attributes(params[:volunteer])
      redirect_to @volunteer, notice: 'Volunteer was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy

    redirect_to volunteers_url
  end
end

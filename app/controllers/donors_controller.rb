# -*- encoding : utf-8 -*-
class DonorsController < ApplicationController
  helper_method :donor, :donors

  def create
    if donor.save
      redirect_to donors_path, notice: 'Donor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if donor.update_attributes(donor_params)
      redirect_to donors_path, notice: 'Donor was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    donor.destroy

    redirect_to donors_path
  end

  def donor
    @donor ||= params[:id] ? Donor.find(params[:id]) : Donor.new(donor_params)
  end

  def donors
    @donors ||= Donor.all
  end

  private

  def allowable
    [
      :name
    ]
  end

  def donor_params
    params.require(:donor).permit(*allowable)
  end
end

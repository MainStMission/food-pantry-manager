# -*- encoding : utf-8 -*-
class DonationsController < ApplicationController
  helper_method :donation, :donations

  def create
    if donation.save
      redirect_to donations_path, notice: "Donation was successfully created."
    else
      render "new"
    end
  end

  def update
    if donation.update_attributes(donation_params)
      redirect_to donations_path, notice: "Donation was successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    donation.destroy

    redirect_to donations_path, notice: "Donation deleted."
  end

  def donation
    @donation ||= params[:id] ? Donation.find(params[:id]) : Donation.new(donation_params)
  end

  def donations
    @donations ||= Donation.all
  end

  private

  def allowable
    [
      :weight, :donor_id
    ]
  end

  def donation_params
    params.require(:donation).permit(*allowable)
  end
end

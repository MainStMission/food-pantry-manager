# -*- encoding : utf-8 -*-
class DonationsController < ApplicationController
  helper_method :donation, :donations

  def create
    donation.attributes = params[:donation]

    if donation.save
      redirect_to donations_path, notice: "Donation was successfully created."
    else
      render "new"
    end
  end

  def update
    donation.attributes = params[:donation]

    if donation.save
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
    @cache_donation ||= Donation.find_or_initialize_by_id(params[:id])
  end

  def donations
    @cache_donations ||= Donation.all
  end
end

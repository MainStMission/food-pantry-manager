# -*- encoding : utf-8 -*-
class DonationsController < ApplicationController

  include RestfulJson::DefaultController

  before_filter :authenticate_user!
  expose(:donation)
  expose(:donations)

  def create
    if donation.save
      redirect_to :back, notice: 'Thank you for your donation.'
    else
      render 'new'
    end
  end

  def update
    if donation.save
      redirect_to donations_path, notice: 'Donation was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    donation.destroy

    redirect_to donations_path, notice: 'Donation deleted.'
  end
  
  def show
    donation = Donation.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = DonationPdf.new(donation)
        send_data pdf.render, filename: "donation_#{donation.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
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

class DonorsController < ApplicationController
  helper_method :donor, :donors

  def create
    donor.attributes = params[:donor]

    if donor.save
      redirect_to donors_path, notice: 'Donor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    donor.attributes = params[:donor]

    if donor.save
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
    @cache_donor ||= Donor.find_or_initialize_by_id(params[:id])
  end

  def donors
    @cache_donors ||= Donor.all
  end
end

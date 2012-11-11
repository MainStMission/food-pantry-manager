# -*- encoding : utf-8 -*-
class DonorsController < ApplicationController
  expose(:donor)
  expose(:donors)

  def create
    if donor.save
      redirect_to donors_path, notice: 'Donor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
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
  end
end

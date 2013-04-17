class HouseholdsController < ApplicationController

  expose(:households)
  expose(:household, strategy: StrongParametersStrategy)
  expose(:neighbor)
  expose(:neighbors)

  def create
    if household.save
      redirect_to households_path, notice: 'Household was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if household.save
      redirect_to households_path, notice: 'Household was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
    household = Household.find(params[:id])
  end

  def destroy
    household.destroy

    redirect_to households_path, notice: 'Household deleted.'
  end




    private

    def allowable
      [
          :household_name, :name, neighbors_attributes: [
          :city, :close_date, :date_of_proof, :first_name, :middle_name, :street, :apt,
          :food_stamps, :last_name, :monthly_income, :notes, :house_rank,
          :open_date, :phone, :proof_of_residency_type, :email, :sex, :rent, :residency_date,
          :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
          :utilities, :zip, :age, :created_at, :updated_at, :neighbors_attributes, :encrypted_ssn
      ]
      ]
    end

    def household_params
      params.require(:household).permit(*allowable)
    end

  end

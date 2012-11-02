class Neighbor < ActiveRecord::Base   attr_accessible :car_payment, :city,
:close_date, :date_of_proof, :first_name, :food_stamps, :last_name,
:monthly_income, :number_of_children, :open_date, :phone,
:proof_of_residency_type, :rent, :residency_date, :residency_type, :smokes,
:spouse, :ss_numb, :state, :street, :utilities, :zip 
end

class Neighbor < ActiveRecord::Base  

  attr_accessible :city,
   :close_date, :notes, :date_of_proof, :first_name, :food_stamps, :last_name,
   :monthly_income, :number_of_children, :open_date, :phone,
   :proof_of_residency_type, :rent, :residency_date, :proof_of_residency_type, :smokes,
   :spouse, :ss_numb, :state, :street, :utilities, :zip ,:created_at, :updated_at

   def name
     "#{first_name} #{last_name}"
   end
   
end

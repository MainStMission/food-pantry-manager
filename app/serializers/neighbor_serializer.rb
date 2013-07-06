class NeighborSerializer < ActiveModel::Serializer

  attributes :id, :city, :close_date, :date_of_proof, :first_name, :middle_name,  :street,
      :food_stamps, :last_name, :monthly_income, :notes, 
      :open_date, :phone, :proof_of_residency_type, :email, :rent, :residency_date,
      :proof_of_residency_type, :smokes, :spouse,  :state, :street,
      :utilities, :zip ,:created_at, :sex, :apt, :updated_at ,:birth_date
end

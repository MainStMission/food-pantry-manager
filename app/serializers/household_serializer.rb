class HouseholdSerializer < ActiveModel::Serializer

  has_many :visits, :neighbors
  embed :ids, include: true


attributes :household_name, :name, :box_type, :income1, :income2, :income3, :inc_amt1, :inc_amt2,
        :inc_amt3, :expense1, :expense2, :expense3, :exp_amt1, :exp_amt2, :exp_amt3, :exp_amt4, :expense4, 
        :option1, :option2, :opt_val1, :opt_val2, :notes, :street, :apt, :state, :city, :zip,
        :food_alert, :prayer_request, :money_notes, :special_needs, :how_heard,
        :proof_of_residency_type, :date_of_proof, :post_prayer, :post_needs, :christmas,
        :bool1, :bool_val1, :bool2, :bool_val2, :bool3, :bool_val3, :bool4, :bool_val4,
        :bool5, :bool_val5, :s_numb, :s_box, :income4, :inc_amt4
      
   
end

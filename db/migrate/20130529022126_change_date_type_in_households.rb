class ChangeDateTypeInHouseholds < ActiveRecord::Migration
  def up
   change_column :households, :date_of_proof, :date 
  end

  def down
  end
end

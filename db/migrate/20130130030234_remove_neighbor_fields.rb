class RemoveNeighborFields < ActiveRecord::Migration
 def change
   remove_column :neighbors, :age, :integer 
   remove_column :neighbors, :sex, :text
   remove_column :neighbors, :household_id, :integer
   remove_column :neighbors, :middle_name, :text
   remove_column :neighbors, :email, :text
 end




end


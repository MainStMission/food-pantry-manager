class AddIndexToNeighbors < ActiveRecord::Migration
  def change
    add_index :neighbors, :household_id 
    add_index :neighbors, [:last_name, :first_name]
  end
end

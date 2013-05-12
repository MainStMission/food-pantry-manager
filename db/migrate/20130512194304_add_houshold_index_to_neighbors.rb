class AddHousholdIndexToNeighbors < ActiveRecord::Migration
  def change
    add_index :neighbors, :household_id
  end
end

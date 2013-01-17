class AddHousholdIdToNeighbor < ActiveRecord::Migration
  def change
    add_column :neighbors, :household_id, :integer
  end
end

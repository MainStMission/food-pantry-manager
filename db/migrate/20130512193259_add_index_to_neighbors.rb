class AddIndexToNeighbors < ActiveRecord::Migration
  def change
    add_index :neighbors, :last_name
  end
end

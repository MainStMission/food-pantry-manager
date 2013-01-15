class AddAgeToNeighbors < ActiveRecord::Migration
  def change
    add_column :neighbors, :age, :integer
  end
end

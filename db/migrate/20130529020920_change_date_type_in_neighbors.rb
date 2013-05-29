class ChangeDateTypeInNeighbors < ActiveRecord::Migration
  def up
    change_column :neighbors, :birth_date, :date
  end

  def down
  end
end

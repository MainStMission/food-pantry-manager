class AddSexToNeighbors < ActiveRecord::Migration
  def change
    add_column :neighbors, :sex, :string
    remove_column :neighbors, :person_id
  end
end

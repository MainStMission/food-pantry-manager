class AddColumnsForAptDone < ActiveRecord::Migration
  def up
    add_column :neighbors, :apt, :string 
    add_column :neighbors, :done, :boolean
  end

  def down
    remove_column :neighbors, :apt, :string
    remove_column :neighbors, :done, :boolean
  end
end

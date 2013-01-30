class AddBackColumsToNeighborAsStrings < ActiveRecord::Migration
  def change
   add_column :neighbors, :age, :integer 
   add_column :neighbors, :sex, :string
   add_column :neighbors, :household_id, :integer
   add_column :neighbors, :middle_name, :string
   add_column :neighbors, :email, :string
  end
end

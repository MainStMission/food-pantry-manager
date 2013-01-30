class AddMNameAgeSexEmailHousholdIdToNeighbors < ActiveRecord::Migration
  def change
    add_column :neighbors, :age, :integer 
    add_column :neighbors, :sex, :text
    add_column :neighbors, :household_id, :integer
    add_column :neighbors, :middle_name, :text
    add_column :neighbors, :email, :text
  end
end

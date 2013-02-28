class AddMNameAgeSexEmailHousholdIdToNeighbors < ActiveRecord::Migration
  def self.up
    add_column :neighbors, :age, :integer 
    add_column :neighbors, :sex, :string
    add_column :neighbors, :household_id, :integer
    add_column :neighbors, :middle_name, :string
    add_column :neighbors, :email, :string
  end

  def self.down
    remove_column :neighbors, :age, :integer 
    remove_column :neighbors, :sex, :string
    remove_column :neighbors, :household_id, :integer
    remove_column :neighbors, :middle_name, :string
    remove_column :neighbors, :email, :string
  end

end

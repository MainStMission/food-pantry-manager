class AddMNameAgeSexEmailHousholdIdToNeighbors < ActiveRecord::Migration
  def self.up
    add_column :neighbors, :age, :integer 
    add_column :neighbors, :sex, :text
    add_column :neighbors, :household_id, :integer
    add_column :neighbors, :middle_name, :text
    add_column :neighbors, :email, :text
  end

  def self.down
    remove_column :neighbors, :age, :integer 
    remove_column :neighbors, :sex, :text
    remove_column :neighbors, :household_id, :integer
    remove_column :neighbors, :middle_name, :text
    remove_column :neighbors, :email, :text
  end

end

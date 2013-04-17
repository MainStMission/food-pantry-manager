class AddBirthDateToNeighbor < ActiveRecord::Migration
  def change
    add_column :neighbors, :birth_date, :datetime   
  end
end

class AddIndexToHouseholds < ActiveRecord::Migration
  def change
    add_index :households, :household_name , unique: true
  end
end

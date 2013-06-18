class AddStorageBoxToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :s_numb, :integer
    add_column :households, :s_box, :integer
  end
end

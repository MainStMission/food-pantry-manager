class AddDescripHealthyToFoodlines < ActiveRecord::Migration
  def change
    add_column :foodlines, :description, :string
    add_column :foodlines, :healthy, :string
  end
end

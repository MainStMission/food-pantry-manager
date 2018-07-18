class AddHealthToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :healthy, :string
  end
end

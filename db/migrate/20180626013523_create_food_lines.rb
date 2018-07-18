class CreateFoodLines < ActiveRecord::Migration
  def change
    create_table :foodlines do |t|
      t.integer :visit_id
      t.integer :food_id
      t.integer :household_id
      t.decimal :quantity
      t.integer :price,   :precision => 8, :scale => 2
      t.timestamps
    end
  end
end

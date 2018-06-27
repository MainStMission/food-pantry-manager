class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :description
      t.string :upc
      t.integer :guiding_star
      t.string :f2e
      t.integer :tab_val

      t.timestamps
    end
  end
end

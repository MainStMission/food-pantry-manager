class CreateFoodlinesRefToHouseholdsRefToVisitRefToFood < ActiveRecord::Migration
  def up
    create_table :foodlines do |t|
      t.integer  :quantity
      t.decimal  :price,  :precision => 8, :scale => 2
      t.timestamps
    end
  end


  def down
  end
end

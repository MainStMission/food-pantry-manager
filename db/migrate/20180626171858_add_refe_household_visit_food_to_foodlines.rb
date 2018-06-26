class AddRefeHouseholdVisitFoodToFoodlines < ActiveRecord::Migration
  def change
    add_column :foodlines, :household_id, :integer
    add_column :foodlines, :visit_id, :integer
    add_column :foodlines, :food_id, :integer
  end
end

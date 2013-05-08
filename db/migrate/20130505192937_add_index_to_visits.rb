class AddIndexToVisits < ActiveRecord::Migration
  def change
    add_index :visits, :visited_on
    add_index :visits, :household_id
  end
end

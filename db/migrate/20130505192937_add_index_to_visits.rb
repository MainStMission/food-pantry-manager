class AddIndexToVisits < ActiveRecord::Migration
  def change
    add_index :visits, :visited_om
    add_index :visits, :household_id
  end
end

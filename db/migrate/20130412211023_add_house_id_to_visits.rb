class AddHouseIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :household_id, :integer
  end
end

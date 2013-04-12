class AddHouseIdToVisits < ActiveRecord::Migration
  def change
    add column :visits, :household_id, :string
  end
end

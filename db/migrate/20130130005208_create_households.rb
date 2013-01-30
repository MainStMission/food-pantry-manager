class CreateHouseholds < ActiveRecord::Migration
  def up
    create_table :households do |t|
     t.string :household_name
     t.string :name
    end
  end

  def down
    drop table
  end
end

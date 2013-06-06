class AddColumnsToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :income4, :string
    add_column :households, :inc_amt4, :decimal,  :precision => 8, :scale => 2
    add_column :households,  :exp_amt4, :decimal,  :precision => 8, :scale => 2
    add_column :households, :expense4, :string

  end
end

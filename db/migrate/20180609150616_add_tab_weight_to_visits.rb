class AddTabWeightToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :tab, :integer
    add_column :visits, :weight, :decimal
  end
end

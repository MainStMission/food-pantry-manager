class AddTabTransRefToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :tab_tran_id, :integer
    add_index :visits, :tab_tran_id
  end
end

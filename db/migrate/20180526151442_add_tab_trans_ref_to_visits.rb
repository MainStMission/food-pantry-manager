class AddTabTransRefToVisits < ActiveRecord::Migration
  def change
    add_index :visits :tab_tran_id
  end
end

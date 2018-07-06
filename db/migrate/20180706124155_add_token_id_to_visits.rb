class AddTokenIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :token_id, :integer
  end
end

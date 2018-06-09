class AddTabBooleanToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :istab, :boolean, default: false
  end
end

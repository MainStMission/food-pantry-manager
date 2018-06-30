class AddIndexesToFood < ActiveRecord::Migration
  def change
    add_index :foods, :description
    add_index :foods, :upc
  end
end

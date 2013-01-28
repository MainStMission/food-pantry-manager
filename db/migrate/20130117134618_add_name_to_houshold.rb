class AddNameToHoushold < ActiveRecord::Migration
  def change
    add_column :households, :name, :string
    remove_column :households, :person_id, :integer
    remove_column :households, :friend_id, :integer
  end
end

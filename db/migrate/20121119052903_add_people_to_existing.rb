class AddPeopleToExisting < ActiveRecord::Migration
  def change
    add_column :donors,     :person_id, :integer
    add_column :neighbors,  :person_id, :integer
    add_column :users,      :person_id, :integer
    add_column :volunteers, :person_id, :integer

    change_column :donors,     :person_id, :integer, null: false
    change_column :neighbors,  :person_id, :integer, null: false
    change_column :users,      :person_id, :integer, null: false
    change_column :volunteers, :person_id, :integer, null: false
  end
end

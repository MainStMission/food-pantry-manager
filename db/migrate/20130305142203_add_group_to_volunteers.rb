class AddGroupToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :group, :string
  end
end

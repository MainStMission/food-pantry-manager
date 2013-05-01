class AddColumnsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :cell_phone, :string
    add_column :volunteers, :birthday,   :datetime
    add_column :volunteers, :nick_name,  :string
    add_column :volunteers, :skills,     :string
    add_column :volunteers, :contact,    :string
    add_column :volunteers, :notes,      :string
    add_column :volunteers, :admin,      :boolean
  end
end

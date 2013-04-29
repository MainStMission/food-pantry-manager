class AddAtrributesToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :starch , :string
    add_column :visits, :cereal, :string
    add_column :visits, :option1, :string
    add_column :visits, :option2, :string
    add_column :visits, :optionb, :boolean
  end
end

class AddCreatedAtUpdatedAtoHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :created_at, :datetime
    add_column :households, :updated_at, :datetime
  end
end

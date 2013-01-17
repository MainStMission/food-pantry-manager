class RenameRelationshipToHouseholdName < ActiveRecord::Migration
  def up
    rename_column :households, :relationship, :household_name
  end

  def down
    rename_column :households, :household_name, :relationship
  end
end

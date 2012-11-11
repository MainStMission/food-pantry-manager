class RenameNeighborSocialSecurityNumber < ActiveRecord::Migration
  def up
    rename_column :neighbors, :ss_numb, :ssn
  end

  def down
  end
end

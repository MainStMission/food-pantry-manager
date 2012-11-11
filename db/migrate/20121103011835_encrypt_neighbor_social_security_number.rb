class EncryptNeighborSocialSecurityNumber < ActiveRecord::Migration
  def up
    remove_column :neighbors, :ssn
    add_column :neighbors, :encrypted_ssn     , :string
    add_column :neighbors, :encrypted_ssn_iv  , :string
    add_column :neighbors, :encrypted_ssn_salt, :string
  end

  def down
  end
end

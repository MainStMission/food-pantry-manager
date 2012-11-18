class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.string :name
      t.string :encrypted_ssn
      t.integer :age
      t.string :relation
      t.string :neighbor_id

      t.timestamps
    end
  end
end

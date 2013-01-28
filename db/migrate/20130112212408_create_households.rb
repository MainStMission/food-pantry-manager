class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.integer :person_id
      t.integer :friend_id
      t.string :relationship

      t.timestamps
    end
  end
end

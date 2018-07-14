class RedoTokenTable < ActiveRecord::Migration
  def up
    create_table :tokens do |t|
      t.integer :household_id
      t.datetime :issue_date
      t.datetime :expiration_date
      t.integer :initial_value
      t.integer :current_value
      t.string :flavor
      t.boolean :isexpired

      t.timestamps
    end
  end

  def down
  end
end

class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :household_id
      t.date :issue_date
      t.date :expiration_date
      t.integer :initial_value
      t.integer :current_value
      t.string :flavor
      t.boolean :isexpired

      t.timestamps
    end
  end
end

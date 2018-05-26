class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :household
      t.integer :quantity
      t.datetime :issue_date
      t.datetime :expiration_date

      t.timestamps
    end
    add_index :tokens, :household_id
  end
end

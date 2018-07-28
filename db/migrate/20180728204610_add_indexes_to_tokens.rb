class AddIndexesToTokens < ActiveRecord::Migration
  def change
    add_index :tokens, :household_id
    add_index :tokens, :issue_date
    add_index :tokens, :expiration_date
  end
end

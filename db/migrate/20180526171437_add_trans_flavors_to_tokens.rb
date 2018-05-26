class AddTransFlavorsToTokens < ActiveRecord::Migration
  def change

    add_column :tokens, :flavor,      :string
    add_column :tokens, :tag,         :string
    add_column :tokens, :tab_tran_id, :integer
    add_index  :tokens, :tab_tran_id
    
  end
end

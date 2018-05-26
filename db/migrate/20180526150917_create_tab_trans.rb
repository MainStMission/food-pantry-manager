class CreateTabTrans < ActiveRecord::Migration
  def change
    create_table :tab_trans do |t|
      t.references :visit
      t.references :household
      t.string :tag
      t.integer :quantity

      t.timestamps
    end
    add_index :tab_trans, :visit_id
    add_index :tab_trans, :household_id
  end
end

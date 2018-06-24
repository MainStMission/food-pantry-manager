class CreateSaleTrans < ActiveRecord::Migration
  def change
    create_table :sale_trans do |t|
      t.integer :household_id
      t.integer :visit_id
      t.date :date
      t.string :tag
      t.decimal :weight
      t.integer :tab_val

      t.timestamps
    end
  end
end

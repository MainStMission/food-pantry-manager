# -*- encoding : utf-8 -*-
class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :donor
      t.decimal :weight

      t.timestamps
    end
    add_index :donations, :donor_id
  end
end

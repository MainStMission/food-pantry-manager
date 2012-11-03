# -*- encoding : utf-8 -*-
class CreateNeighbors < ActiveRecord::Migration
  def change
    create_table :neighbors do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :phone
      t.string  :ss_numb
      t.decimal :monthly_income, :precision => 8,:scale => 2
      t.decimal :food_stamps, :precision => 8,:scale => 2
      t.decimal  :rent, :precision => 8,:scale => 2
      t.decimal :utilities, :precision => 8,:scale => 2
      t.datetime :residency_date
      t.boolean :spouse
      t.integer :number_of_children
      t.datetime :open_date
      t.datetime :close_date
      t.string  :proof_of_residency_type
      t.datetime :date_of_proof
      t.boolean :smokes
      t.timestamps
    end
  end
end

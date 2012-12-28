class AddVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :neighbor

      t.date :visited_on, null: false
      t.text :items_received
      t.text :notes

      t.timestamps
    end
  end
end

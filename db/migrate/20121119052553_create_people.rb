class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.timestamps
    end
  end
end

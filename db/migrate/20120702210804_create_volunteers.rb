class CreateVolunteers < ActiveRecord::Migration
  
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :status

      t.timestamps
    end
  end
end

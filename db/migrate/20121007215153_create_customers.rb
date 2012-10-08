class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :cust_first_name
      t.string :cust_last_name
      t.string :cust_email
      t.string :cust_street
      t.string :cust_city
      t.string :cust_state
      t.string :cust_state
      t.string :cust_zip
      t.string :cust_status
      t.string :cust_phone
      t.string :cust_ss_numb
      t.integer :cust_family

      t.timestamps
    end
  end
end

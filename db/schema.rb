# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20121013185414) do

  create_table "donations", :force => true do |t|
    t.integer  "donor_id"
    t.decimal  "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "donations", ["donor_id"], :name => "index_donations_on_donor_id"

  create_table "donors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

=======
ActiveRecord::Schema.define(:version => 20121025185618) do

  create_table "customers", :force => true do |t|
    t.string   "cust_first_name"
    t.string   "cust_last_name"
    t.string   "cust_email"
    t.string   "cust_street"
    t.string   "cust_city"
    t.string   "cust_state"
    t.string   "cust_zip"
    t.string   "cust_status"
    t.string   "cust_phone"
    t.string   "cust_ss_numb"
    t.integer  "cust_family"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "family_members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ss_numb"
    t.integer  "neighbor_id"
    t.integer  "age"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "family_members", ["neighbor_id"], :name => "index_family_members_on_neighbor_id"

>>>>>>> a2f4cd4227b3820d20424c7107aa679fe27905bc
  create_table "neighbors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "ss_numb"
    t.decimal  "monthly_income",          :precision => 8, :scale => 2
    t.decimal  "food_stamps",             :precision => 8, :scale => 2
    t.decimal  "rent",                    :precision => 8, :scale => 2
    t.decimal  "utilities",               :precision => 8, :scale => 2
    t.datetime "residency_date"
    t.boolean  "spouse"
    t.integer  "number_of_children"
    t.datetime "open_date"
    t.datetime "close_date"
    t.string   "proof_of_residency_type"
    t.datetime "date_of_proof"
    t.boolean  "smokes"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end
<<<<<<< HEAD

  create_table "time_cards", :force => true do |t|
    t.integer  "volunteer_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end
=======
>>>>>>> a2f4cd4227b3820d20424c7107aa679fe27905bc

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "volunteers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

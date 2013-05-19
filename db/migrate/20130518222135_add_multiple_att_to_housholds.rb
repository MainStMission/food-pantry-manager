class AddMultipleAttToHousholds < ActiveRecord::Migration
  def change
    add_column :households, :street,           :string
    add_column :households, :apt,              :string
    add_column :households, :state,            :string
    add_column :households, :city,             :string
    add_column :households, :zip,              :string
    add_column :households, :food_alert,       :string
    add_column :households, :prayer_request,   :string
    add_column :households, :money_notes,      :text
    add_column :households, :special_needs,    :string
    add_column :households, :how_heard,        :string
    add_column :households, :proof_of_residency_type,  :string
    add_column :households, :date_of_proof,  :datetime
    add_column :households, :post_prayer,    :boolean
    add_column :households, :post_needs,     :boolean
    add_column :households, :christmas,      :boolean
    add_column :households, :bool1,          :boolean
    add_column :households, :bool_val1,      :string
    add_column :households, :bool2,          :boolean
    add_column :households, :bool_val2,      :string
    add_column :households, :bool3,          :boolean
    add_column :households, :bool_val3,      :string
    add_column :households, :bool4,          :boolean
    add_column :households, :bool_val4,      :string
    add_column :households, :bool5,          :boolean
    add_column :households, :bool_val5,      :string

  end
end

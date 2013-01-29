# -*- encoding : utf-8 -*-
class ImplementAuthorizationScheme < ActiveRecord::Migration
    def change
        create_table :access_levels do |t|
            t.string :name, null: false
            t.integer :level, null: false
        end   
        AccessLevel.create!(name: "Volunteer", level: 1)
        AccessLevel.create!(name: "Super-Volunteer", level: 2)
        AccessLevel.create!(name: "Admin", level: 3)

        add_column :users, :access_level_id, :integer
    end
end

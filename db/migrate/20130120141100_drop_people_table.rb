class DropPeopleTable < ActiveRecord::Migration
  
    def change
    drop_table :people
  end

 end

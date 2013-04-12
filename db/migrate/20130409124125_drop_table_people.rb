class DropTablePeople < ActiveRecord::Migration
  def up
    drop_table :people
  end

  def down
      raise ActiveRecord::IrreversibleMigration
  end
end

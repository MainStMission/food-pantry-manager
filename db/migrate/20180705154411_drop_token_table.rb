class DropTokenTable < ActiveRecord::Migration
  def up
    drop_table :tokens
  end

  def down
  end
end

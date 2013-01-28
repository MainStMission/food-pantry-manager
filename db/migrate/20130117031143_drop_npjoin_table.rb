class DropNpjoinTable < ActiveRecord::Migration
  def up
    drop_table :npjoin
  end

  def down
  end
end

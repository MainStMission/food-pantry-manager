# -*- encoding : utf-8 -*-
class CreateTimeCards < ActiveRecord::Migration
  def up
    create_table :time_cards do |t|
      t.references :volunteer
      t.datetime :start_time
      t.datetime :end_time
    end
  end

  def down
    drop_table :time_cards
  end
end

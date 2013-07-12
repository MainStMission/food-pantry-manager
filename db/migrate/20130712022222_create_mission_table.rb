class CreateMissionTable < ActiveRecord::Migration
  def up
    create_table :mission do |t|
        t.text :visit-note-text
        t.string :visit-note-title

        t.timestamps
     end

  end

  def down
    drop_table :mission
  end
end

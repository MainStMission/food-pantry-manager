class CreateMissionsTable < ActiveRecord::Migration
  def up
    create_table :mission do |t|
        t.text :visit_note_text
        t.string :visit_note_title

        t.timestamps
     end

  end

  def down
    drop_table :mission
  end
end

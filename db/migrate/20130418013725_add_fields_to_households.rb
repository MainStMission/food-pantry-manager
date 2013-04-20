class AddFieldsToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :box_type, :text 
    add_column :households, :income1,  :text
    add_column  :households,  :inc_amt1,  :decimal, :precision  => 8, :scale  => 2
    add_column  :households, :income2, :text
    add_column  :households, :inc_amt2, :decimal, :precision  => 8, :scale  => 2
    add_column  :households, :income3, :text
    add_column  :households, :inc_amt3, :decimal, :precision  =>  8, :scale  => 2
    add_column  :households, :expense1,  :text
    add_column  :households,  :exp_amt1,  :decimal, :precision  => 8, :scale  => 2
    add_column  :households, :expense2,  :text
    add_column  :households, :exp_amt2, :decimal, :precision  => 8, :scale  => 2
    add_column  :households, :expense3, :text
    add_column  :households, :exp_amt3, :decimal, :precision  => 8, :scale  => 2
    add_column  :households, :option1,  :text
    add_column  :households, :opt_val1,  :text
    add_column  :households,  :option2,  :text
    add_column  :households, :opt_val2, :text
    add_column  :households,  :notes,    :text

    

  end
end

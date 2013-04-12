class DonorsAddColumnToolsId < ActiveRecord::Migration
 
  def up
        add_column :donors, :tools_id , :integer
   end

    def down
          drop_column :donors, :tools_id
    end

end

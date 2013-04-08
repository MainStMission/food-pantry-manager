
class DonorsRenameTableFromNameToFirstName < ActiveRecord::Migration
  def up
        rename_column :donors, :name, :first_name
  end

    def down
          rename_column :donors, :first_name, :name
    end
end

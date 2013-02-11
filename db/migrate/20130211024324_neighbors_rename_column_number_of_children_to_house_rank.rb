class NeighborsRenameColumnNumberOfChildrenToHouseRank < ActiveRecord::Migration
  def change

  rename_column :neighbors, :number_of_children, :house_rank  

  end

end

class AddCommentsToNeighbors < ActiveRecord::Migration
  def change    
    add_column :neighbors, :comments, :text 
  end
end

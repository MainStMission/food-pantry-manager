class AddNotesToNeighbors < ActiveRecord::Migration
  def change    
    add_column :neighbors, :notes, :text 
  end
end

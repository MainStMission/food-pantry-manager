class AddPeopleToNeighbors < ActiveRecord::Migration
  def change

    add_column :neighbors, :first_name, :string
    add_column :neighbors, :middle_name, :string
    add_column :neighbors, :last_name, :string
    add_column :neighbors, :street, :string
    add_column :neighbors, :city, :string
    add_column :neighbors, :state, :string
    add_column :neighbors, :zip, :string
    add_column :neighbors, :phone, :string
    add_column :neighbors, :email, :string

  end

end

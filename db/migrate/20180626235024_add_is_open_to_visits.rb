class AddIsOpenToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :isopen, :boolean, default: false
  end
end

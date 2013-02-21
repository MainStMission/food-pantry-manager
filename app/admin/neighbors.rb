ActiveAdmin.register Neighbor do
  

  index do
    column :last_name
    column :first_name
    column :street
    column :city
    column :state
    column :zip
    column :age
    column :sex
    column :email
  end
 end

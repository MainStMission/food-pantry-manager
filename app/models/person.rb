class Person < ActiveRecord::Base

  attr_accessible :address, :age, :city, :email, :first_name, :last_name, :middle_name, :phone, :state, :title, :zip

end

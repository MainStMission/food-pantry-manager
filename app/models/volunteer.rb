class Volunteer < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :phone, :state, :status, :street, :zip
end

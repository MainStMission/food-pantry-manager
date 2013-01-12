class Person < ActiveRecord::Base

  has_many :households
  has_many :relationships, :through => :households 
  has_many :inverse_relaionships, :class_name => 'Houshold', :foreign_key => 'person_id'
  has_many :inverse_relations, :through => :inverse_relationships, :source => :person

  attr_accessible :address, :age, :city, :email, :first_name, :last_name, :middle_name, :phone, :state, :title, :zip

end

class Food < ActiveRecord::Base
  attr_accessible :description, :f2e, :guiding_star, :tab_val, :upc

  include ActiveModel::ForbiddenAttributesProtection
  
  validates :upc, presence: {message: 'You must enter a UPC Code'}
  validates :upc, uniqueness: {message: 'We already have that Item'}
  validates :description, presence: {message: 'You must enter a description'}

end

class Food < ActiveRecord::Base


  include ActiveModel::ForbiddenAttributesProtection
  
  validates :upc, presence: {message: 'You must enter a UPC Code'}
  validates :upc, uniqueness: {message: 'We already have that Item'}
  validates :description, presence: {message: 'You must enter a description'}

  has_many :foodlines

  has_many :households, through: :foodlines

end

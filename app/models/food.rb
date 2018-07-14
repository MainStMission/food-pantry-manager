class Food < ActiveRecord::Base


  include ActiveModel::ForbiddenAttributesProtection
  
  validates :upc, presence: {message: 'You must enter a UPC Code'}
  validates :upc, uniqueness: {message: 'We already have that Item'}
  validates :description, presence: {message: 'You must enter a description'}

  
  has_many :foodlines

  has_many :households, through: :foodlines
  has_many :visits, through: :foodlines

  accepts_nested_attributes_for :foodlines, reject_if: :all_blank
  accepts_nested_attributes_for :visits, reject_if: :all_blank
  accepts_nested_attributes_for :households, reject_if: :all_blank
end

class HouseholdSerializer < ActiveModel::Serializer
  attributes :id, :name, :food_alert

  has_many :visits, :neighbors

  
end

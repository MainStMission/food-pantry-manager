class FoodlineSerializer < ActiveModel::Serializer
  
  attributes :id, :visit_id, :household_id, :food_id, :quantity, :price

end

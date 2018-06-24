class FoodSerializer < ActiveModel::Serializer
  attributes :id, :description, :upc, :guiding_star, :f2e, :tab_val
end

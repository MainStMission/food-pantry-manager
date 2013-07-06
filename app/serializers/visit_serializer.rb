class VisitSerializer < ActiveModel::Serializer

  attributes :id, :cereal, :starch, :option1, :option2, :optionb, :visited_on, :items_received, 
             :notes, :household_id, :neighbor_id

end

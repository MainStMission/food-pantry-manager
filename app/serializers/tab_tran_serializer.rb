class TabTranSerializer < ActiveModel::Serializer
  attributes :id, :tag, :quantity
  has_one :visit
  has_one :household
end

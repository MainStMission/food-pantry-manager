class SaleTranSerializer < ActiveModel::Serializer
  attributes :id, :household_id, :visit_id, :date, :tag, :weight, :tab_val
end

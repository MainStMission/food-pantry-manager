class TokenSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :issue_date, :expiration_date
  has_one :household
end

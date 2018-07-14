class TokenSerializer < ActiveModel::Serializer
  attributes :id, :household_id, :issue_date, :expiration_date, :initial_value, :current_value, :flavor, :isexpired
end

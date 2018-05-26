class Token < ActiveRecord::Base
  belongs_to :household
  attr_accessible :expiration_date, :issue_date, :quantity
end

class TabTran < ActiveRecord::Base
  belongs_to :visit
  belongs_to :household
  belongs_to :token
  attr_accessible :quantity, :tag
end

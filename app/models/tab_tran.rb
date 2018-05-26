class TabTran < ActiveRecord::Base
  belongs_to :visit
  belongs_to :household
  attr_accessible :quantity, :tag
end

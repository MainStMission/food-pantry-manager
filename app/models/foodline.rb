class Foodline < ActiveRecord::Base
  
  include ActiveModel::ForbiddenAttributesProtection
  
  has_paper_trail

  belongs_to :food
  belongs_to :visit
  belongs_to :household

end


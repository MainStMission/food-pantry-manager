class Token < ActiveRecord::Base
  
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to  :household
  has_many    :visits

  has_paper_trail
end

class Token < ActiveRecord::Base
  belongs_to :household
  attr_accessible :expiration_date, :issue_date, :quantity, :flavor, :tag

  has_many :tab_trans   ,    dependent: :delete_all

  accepts_nested_attributes_for :tab_trans, allow_destroy: true, reject_if: :all_blank
  
end

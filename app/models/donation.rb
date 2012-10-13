class Donation < ActiveRecord::Base
  belongs_to :donor
  attr_accessible :weight, :donor_id

  delegate :name, to: :donor, prefix: true

end

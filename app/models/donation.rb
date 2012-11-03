# -*- encoding : utf-8 -*-
class Donation < ActiveRecord::Base
  belongs_to :donor
  attr_accessible :weight, :donor_id

  def donor_name
    donor.name if donor
  end
end

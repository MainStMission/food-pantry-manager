# -*- encoding : utf-8 -*-
class Donation < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :donor

  def donor_name
    donor.name if donor
  end
end

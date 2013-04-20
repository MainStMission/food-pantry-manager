# -*- encoding : utf-8 -*-
class Donation < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :donor

  validates :weight, presence: {message: 'You must enter a weight'}
  validates :weight, :numericality => true
  default_scope order('created_at DESC')

  def donor_name
    donor.name if donor
  end

  def date
    self.created_at.strftime('%B %d, %Y')
  end

end

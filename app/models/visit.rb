# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :neighbor

  delegate :name, to: :neighbor, prefix: true, allow_nil: true
  delegate :number_of_children, to: :neighbor, prefix: true, allow_nil: true
end

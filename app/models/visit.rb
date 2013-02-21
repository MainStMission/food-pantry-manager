# -*- encoding : utf-8 -*-
class Visit < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :neighbor

  delegate :name, to: :neighbor, prefix: true, allow_nil: true

  def show_neighbor
    neighbor.last_name if neighbor
  end

end

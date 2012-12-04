class FamilyMember < ActiveRecord::Base
    include ActiveModel::ForbiddenAttributesProtection
  belongs_to :neighbor

  validates  :neighbor_id , presence: true

  def neighbor_name
    neighbor.name if neighbor
  end

end

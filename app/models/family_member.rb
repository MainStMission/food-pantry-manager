class FamilyMember < ActiveRecord::Base
    include ActiveModel::ForbiddenAttributesProtection
  belongs_to :neighbor

  def neighbor_name
    neighbor.name if neighbor
  end

end

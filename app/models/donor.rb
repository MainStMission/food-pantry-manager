# -*- encoding : utf-8 -*-
class Donor < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :donations, foreign_key: "donor_id"

  has_paper_trail

  def name
    if first_name == " "
      last_name
    else
     [last_name, first_name].join ", "
    end
  end

  # def name= full_name
  #   split = full_name.split(' ', 2)
  #   self.first_name = split.first
  #   self.last_name = split.last
  # end

end

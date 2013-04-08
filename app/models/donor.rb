# -*- encoding : utf-8 -*-
class Donor < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  def name
     [first_name, last_name].join " "
  end

end

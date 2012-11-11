# -*- encoding : utf-8 -*-
class Donor < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end

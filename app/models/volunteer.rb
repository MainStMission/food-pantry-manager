class Volunteer < ActiveRecord::Base
  has_many :time_cards

  attr_accessible :city, :email, :first_name, :last_name, :phone, :state, :status, :street, :zip

  def name
    "#{first_name} #{last_name}"
  end

  def sign_in
    TimeCard.clock_in(self)
  end

  def signed_in?
    TimeCard.volunteer_signed_in?(self)
  end

end

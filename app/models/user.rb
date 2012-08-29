class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :password_digest

  def name
    [first_name, last_name].join(' ')
  end

end

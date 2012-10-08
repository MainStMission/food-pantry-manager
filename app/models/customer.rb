class Customer < ActiveRecord::Base
  attr_accessible :cust_city, :cust_email, :cust_family, :cust_first_name, :cust_last_name, :cust_phone, :cust_ss_numb, :cust_state, :cust_state, :cust_status, :cust_street, :cust_zip
end

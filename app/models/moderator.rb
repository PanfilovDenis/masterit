class Moderator < User
  has_one :region
  attr_accessible :email, :region, :region_attributes, :password, :password_confirmation, :remember_me
end

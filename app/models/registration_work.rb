class RegistrationWork < ActiveRecord::Base
  attr_accessible :area, :city, :name_class, :description, :supervizor, :partners, :email, :name, :nominate, :phone, :picture, :school, :url_work
end

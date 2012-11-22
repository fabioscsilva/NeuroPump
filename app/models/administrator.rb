class Administrator < ActiveRecord::Base
  has_many :clinics

  attr_accessible :active, :address, :email, :mobilephone, :name, :password, :telephone
end

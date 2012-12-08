class Administrator < ActiveRecord::Base
  has_many :clinics

  attr_accessible :active, :address, :email, :mobilephone, :name, :password, :telephone
  
  validates_presence_of :name, :active, :address, :email, :password
  validates :email,:format => {
                             :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
                             :message => "formato incorreto" }
end

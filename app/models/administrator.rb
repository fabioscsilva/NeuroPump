class Administrator < ActiveRecord::Base
  has_many :clinics
  belongs_to :login
  
  attr_accessible :active, :address, :mobilephone, :name, :telephone, :login_id
  
  validates_presence_of :name, :active, :address
  
  validates_presence_of :name, :active, :address, :email, :password
  validates :email,:format => {
                             :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
                             :message => "formato incorreto" }
end

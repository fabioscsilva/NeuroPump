class Administrator < ActiveRecord::Base
  has_many :clinics
  belongs_to :login
  
  attr_accessible :address, :mobilephone, :name, :telephone, :login_id
  
  validates_presence_of :name, :address

end

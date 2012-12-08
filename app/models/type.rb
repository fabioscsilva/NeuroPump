class Type < ActiveRecord::Base
  has_many :logins
  
  attr_accessible :description
  
  validates_presence_of :description
end

class Type < ActiveRecord::Base
  has_many :logins
  
  attr_accessible :description
end

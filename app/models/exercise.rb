class Exercise < ActiveRecord::Base
  attr_accessible :name, :description, :path, :type

  validates_presence_of :name, :path, :type, :description
end

class TestArea < ActiveRecord::Base
  has_many :tests
  attr_accessible :name
  validates_presence_of :name
end

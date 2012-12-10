class Manager < ActiveRecord::Base
  belongs_to :gender
  belongs_to :clinic
  belongs_to :login

  attr_accessible :mobilephone, :telephone, :clinic
end

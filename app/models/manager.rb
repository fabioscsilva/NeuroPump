class Manager < ActiveRecord::Base
  belongs_to :gender
  belongs_to :clinic
  belongs_to :login

  attr_accessible :mobilephone, :telephone,  :gender_id, :clinic_id, :login_id
end

class Session < ActiveRecord::Base
  belongs_to :secretary
  belongs_to :patient
  belongs_to :neuropsychologist

  attr_accessible :description, :session_day
end

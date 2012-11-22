class Session < ActiveRecord::Base
  belongs_to :secretaries
  belongs_to :patients
  belongs_to :neuropsychologists

  attr_accessible :description, :session_day
end

class Payment < ActiveRecord::Base
  belongs_to :clinic

  attr_accessible :creation_date, :due_date, :payed, :payment_date, :reference, :value, :entity
  
  validates_presence_of :creation_date, :due_date, :reference, :value

  scope :in_clinic, lambda { |clinic_id| 
  	where(:clinic_id => clinic_id)
  }
end

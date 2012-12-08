class Payment < ActiveRecord::Base
  belongs_to :clinic

  attr_accessible :creation_date, :due_date, :payed, :payment_date, :reference, :value
  
  validates_presence_of :creation_date, :due_date, :reference, :value
end

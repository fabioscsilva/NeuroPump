class Payment < ActiveRecord::Base
  belongs_to :clinics

  attr_accessible :creation_date, :due_date, :payed, :payment_date, :reference, :value
end

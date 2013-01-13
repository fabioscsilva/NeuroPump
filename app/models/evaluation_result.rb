class EvaluationResult < ActiveRecord::Base 
  belongs_to :appointment
  
  attr_accessible :conclusion, :context, :solution
end

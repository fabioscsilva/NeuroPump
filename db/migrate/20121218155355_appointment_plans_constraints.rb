class AppointmentPlansConstraints < ActiveRecord::Migration
  def change

  	###appointments
  	execute <<-SQL
      ALTER TABLE appointment_plans ADD CONSTRAINT fk_appointment_plans_appointment FOREIGN KEY (appointment_id) REFERENCES appointments(id)
    SQL

    execute <<-SQL
      ALTER TABLE appointment_plans ADD CONSTRAINT fk_appointment_plans_tests FOREIGN KEY (test_id) REFERENCES tests(id)
    SQL
  
  
  end
end

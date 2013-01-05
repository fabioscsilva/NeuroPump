class AppointmentConstraints2 < ActiveRecord::Migration
 def change
 	
    execute <<-SQL
      ALTER TABLE appointments ADD CONSTRAINT fk_appointments_appointment_types FOREIGN KEY (appointment_type_id) REFERENCES appointment_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE appointments ADD CONSTRAINT fk_appointments_appointment_statuses FOREIGN KEY (appointment_status_id) REFERENCES appointment_statuses(id)
    SQL

 end
end

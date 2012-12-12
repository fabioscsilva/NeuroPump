class AppointmentConstraints < ActiveRecord::Migration
  def change

  	###appointments
  	execute <<-SQL
      ALTER TABLE appointments ADD CONSTRAINT fk_appointments_patients FOREIGN KEY (patient_id) REFERENCES patients(id)
    SQL
    execute <<-SQL
      ALTER TABLE appointments ADD CONSTRAINT fk_appointments_secretaries FOREIGN KEY (secretary_id) REFERENCES secretaries(id)
    SQL
    execute <<-SQL
      ALTER TABLE appointments ADD CONSTRAINT fk_appointments_neuropsychologists FOREIGN KEY (neuropsychologist_id) REFERENCES neuropsychologists(id)
    SQL

  end
  
end

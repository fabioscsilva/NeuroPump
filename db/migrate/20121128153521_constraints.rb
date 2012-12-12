class Constraints < ActiveRecord::Migration
  def change

  	###sessions
  	execute <<-SQL
      ALTER TABLE sessions ADD CONSTRAINT fk_sessions_patients FOREIGN KEY (patient_id) REFERENCES patients(id)
    SQL
    execute <<-SQL
      ALTER TABLE sessions ADD CONSTRAINT fk_sessions_secretaries FOREIGN KEY (secretary_id) REFERENCES secretaries(id)
    SQL
    execute <<-SQL
      ALTER TABLE sessions ADD CONSTRAINT fk_sessions_neuropsychologists FOREIGN KEY (neuropsychologist_id) REFERENCES neuropsychologists(id)
    SQL

    ###clinics
    execute <<-SQL
      ALTER TABLE clinics ADD CONSTRAINT fk_clinics_administrator FOREIGN KEY (administrator_id) REFERENCES administrators(id)
    SQL

    ###payments
    execute <<-SQL
      ALTER TABLE payments ADD CONSTRAINT fk_payments_clinics FOREIGN KEY (clinic_id) REFERENCES clinics(id)
    SQL

    ###managers
    execute <<-SQL
      ALTER TABLE managers ADD CONSTRAINT fk_managers_genders FOREIGN KEY (gender_id) REFERENCES genders(id)
    SQL
    execute <<-SQL
      ALTER TABLE managers ADD CONSTRAINT fk_managers_clinics FOREIGN KEY (clinic_id) REFERENCES clinics(id)
    SQL
    execute <<-SQL
      ALTER TABLE managers ADD CONSTRAINT fk_managers_logins FOREIGN KEY (login_id) REFERENCES logins(id)
    SQL

    ###neuropsychologists
    execute <<-SQL
      ALTER TABLE neuropsychologists ADD CONSTRAINT fk_neuropsychologists_genders FOREIGN KEY (gender_id) REFERENCES genders(id)
    SQL
    execute <<-SQL
      ALTER TABLE neuropsychologists ADD CONSTRAINT fk_neuropsychologists_clinics FOREIGN KEY (clinic_id) REFERENCES clinics(id)
    SQL
    execute <<-SQL
      ALTER TABLE neuropsychologists ADD CONSTRAINT fk_neuropsychologists_logins FOREIGN KEY (login_id) REFERENCES logins(id)
    SQL

    ###secretaries
    execute <<-SQL
      ALTER TABLE secretaries ADD CONSTRAINT fk_secretaries_genders FOREIGN KEY (gender_id) REFERENCES genders(id)
    SQL
    execute <<-SQL
      ALTER TABLE secretaries ADD CONSTRAINT fk_secretaries_clinics FOREIGN KEY (clinic_id) REFERENCES clinics(id)
    SQL
    execute <<-SQL
      ALTER TABLE secretaries ADD CONSTRAINT fk_secretaries_logins FOREIGN KEY (login_id) REFERENCES logins(id)
    SQL

    ###patients
    execute <<-SQL
      ALTER TABLE patients ADD CONSTRAINT fk_patients_genders FOREIGN KEY (gender_id) REFERENCES genders(id)
    SQL
    execute <<-SQL
      ALTER TABLE patients ADD CONSTRAINT fk_patients_clinics FOREIGN KEY (clinic_id) REFERENCES clinics(id)
    SQL
    execute <<-SQL
      ALTER TABLE patients ADD CONSTRAINT fk_patients_civil_statuses FOREIGN KEY (civil_status_id) REFERENCES civil_statuses(id)
    SQL
    execute <<-SQL
      ALTER TABLE patients ADD CONSTRAINT fk_patients_handednesses FOREIGN KEY (handedness_id) REFERENCES handednesses(id)
    SQL
    execute <<-SQL
      ALTER TABLE patients ADD CONSTRAINT fk_patients_logins FOREIGN KEY (login_id) REFERENCES logins(id)
    SQL

    ###clinical_histories
    execute <<-SQL
      ALTER TABLE clinical_histories ADD CONSTRAINT fk_clinical_histories_genders FOREIGN KEY (patient_id) REFERENCES patients(id)
    SQL
    
    ###logins
    execute <<-SQL
      ALTER TABLE logins ADD CONSTRAINT fk_logins_types FOREIGN KEY (type_id) REFERENCES types(id)
    SQL
    
    ##Admin
    execute <<-SQL
      ALTER TABLE administrators ADD CONSTRAINT fk_administrators_logins FOREIGN KEY (login_id) REFERENCES logins(id)
    SQL

  end
end

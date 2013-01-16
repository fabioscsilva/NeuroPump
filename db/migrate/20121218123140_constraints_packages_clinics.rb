class ConstraintsPackagesClinics < ActiveRecord::Migration
  
  def change
  	execute <<-SQL
      ALTER TABLE packages_clinics ADD CONSTRAINT fk_package_clinic FOREIGN KEY (clinic_id) REFERENCES clinics(id)
    SQL
    execute <<-SQL
      ALTER TABLE packages_clinics ADD CONSTRAINT fk_package_package FOREIGN KEY (package_id) REFERENCES packages(id)
    SQL
  end
end

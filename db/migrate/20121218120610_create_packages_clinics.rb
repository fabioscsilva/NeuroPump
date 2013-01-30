class CreatePackagesClinics < ActiveRecord::Migration
  def change
    create_table :packages_clinics do |t|
      t.integer :appointment_token , :null => false
      t.datetime :start_date , :null => false
      t.integer :week , :null => false
      t.references :package
      t.references :clinic  
      t.timestamps
    end
  end
end

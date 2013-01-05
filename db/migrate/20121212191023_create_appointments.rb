class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :appointment_day, :null => false
      t.text :description
      t.integer :duration, :default => 60
      t.references :patient
      t.references :secretary
      t.references :neuropsychologist
      t.references :appointment_type
      t.references :appointment_status

      t.timestamps
    end
  end
end

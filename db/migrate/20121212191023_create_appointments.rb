class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :appointment_day, :null => false
      t.text :description
      t.references :patient
      t.references :secretary
      t.references :neuropsychologist

      t.timestamps
    end
  end
end

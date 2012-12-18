class CreateAppointmentPlans < ActiveRecord::Migration
  def change
    create_table :appointment_plans do |t|
      t.references :appointment
      t.references :test
      
      t.timestamps
    end
  end
end

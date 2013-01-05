class FixColumnTestIdOnAppointmentPlan < ActiveRecord::Migration
 def change
    rename_column :appointment_plans, :test_id, :evaluation_test_id
  end
end

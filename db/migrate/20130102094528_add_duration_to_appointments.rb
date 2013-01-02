class AddDurationToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :duration, :time
  end
end

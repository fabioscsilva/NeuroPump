class AddClinicIdToLogins < ActiveRecord::Migration
  def change
  	add_column :logins, :clinic_id, :integer
  end
end

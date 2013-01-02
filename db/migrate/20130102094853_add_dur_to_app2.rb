class AddDurToApp2 < ActiveRecord::Migration
  def change
  	remove_column :appointments, :duration
  	add_column :appointments, :duration, :integer, :default => 60
  end
end

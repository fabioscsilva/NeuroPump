class RemoveActiveColumns < ActiveRecord::Migration
  def change
  	remove_column :administrators, :active
  	remove_column :clinics, :active
  	remove_column :neuropsychologists, :active
  	remove_column :patients, :active
  	remove_column :secretaries, :active
  end
end

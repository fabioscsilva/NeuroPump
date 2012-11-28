class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :telephone
      t.string :mobilephone
      t.string :photo
      t.date :date_of_birth, :null => false
      t.string :identification_code, :null => false
      t.boolean :active, :default => true
      t.integer :gender_id, :null => false
      t.integer :clinic_id, :null => false
      t.integer :civil_status_id, :null => false
      t.integer :handedness_id, :null => false
      t.integer :login_id, :null => false

      t.timestamps
    end
    
  end
end

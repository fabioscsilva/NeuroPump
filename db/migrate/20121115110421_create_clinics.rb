class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :fiscal_number, :null => false
      t.string :email, :null => false
      t.string :telephone
      t.boolean :active, :default => false
      # num_patients
      # num_secretaries
      # num_neuropsychologists 
      #to be derived
      t.integer :administrator_id

      t.timestamps
    end
  end
end

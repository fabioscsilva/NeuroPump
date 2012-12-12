class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :telephone
      t.string :mobilephone
      t.string :photo
      t.string :education
      t.string :profession
      t.date :date_of_birth, :null => false
      t.string :identification_code, :null => false
      t.boolean :active, :default => true
      t.references :gender
      t.references :clinic
      t.references :civil_status
      t.references :handedness
      t.references :login

      t.timestamps
    end
  end
end

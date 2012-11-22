class CreateNeuropsychologists < ActiveRecord::Migration
  def change
    create_table :neuropsychologists do |t|
      t.string :name, :null => false
      t.string :password, :null => false
      t.string :address, :null => false
      t.string :telephone
      t.string :mobilephone
      t.string :email, :null => false
      t.string :photo
      t.date :date_of_birth, :null => false
      t.string :identification_code, :null => false
      t.boolean :active, :default => true
      t.integer :gender_id, :null => false
      t.integer :clinic_id, :null => false

      t.timestamps
    end
  end
end

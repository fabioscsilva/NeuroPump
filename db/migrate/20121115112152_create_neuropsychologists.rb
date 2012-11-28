class CreateNeuropsychologists < ActiveRecord::Migration
  def change
    create_table :neuropsychologists do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :telephone
      t.string :mobilephone
      t.string :photo
      t.date :date_of_birth, :null => false
      t.string :identification_code, :null => false
      t.boolean :active, :default => true
      t.references :gender
      t.references :clinic
      t.references :login

      t.timestamps
    end
  end
end

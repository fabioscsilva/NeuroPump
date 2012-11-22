class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :password, :null => false
      t.string :telephone
      t.string :mobilephone
      t.string :email, :null => false
      t.integer :gender_id, :null => false
      t.integer :clinic_id, :null => false

      t.timestamps
    end
  end
end

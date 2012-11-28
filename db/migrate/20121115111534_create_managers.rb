class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :telephone
      t.string :mobilephone
      t.integer :gender_id, :null => false
      t.integer :clinic_id, :null => false
      t.integer :login_id, :null => false

      t.timestamps
    end
  end
end

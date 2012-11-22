class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :name, :null => false
      t.string :password, :null => false
      t.string :address, :null => false
      t.string :telephone
      t.string :mobilephone
      t.string :email, :null => false
      t.boolean :active, :null => false

      t.timestamps
    end
  end
end

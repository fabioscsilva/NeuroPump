class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :telephone
      t.string :mobilephone
      t.boolean :active, :null => false
      t.references :login
      
      t.timestamps
    end
  end
end

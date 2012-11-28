class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :email, :null => false
      t.string :password, :null => false
      t.integer :type_id, :null => false

      t.timestamps
    end
  end
end

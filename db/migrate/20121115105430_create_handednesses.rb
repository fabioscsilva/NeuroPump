class CreateHandednesses < ActiveRecord::Migration
  def change
    create_table :handednesses do |t|
      t.string :description, :null => false

      t.timestamps
    end
  end
end

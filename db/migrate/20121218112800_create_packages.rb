class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :n_exercises
      t.integer :n_evaluations    
      t.integer :n_appointments
      t.decimal :price, :null => false
      t.timestamps
    end
  end
end

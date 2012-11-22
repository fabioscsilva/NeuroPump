class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :session_day, :null => false
      t.text :description
      t.integer :patient_id, :null => false
      t.integer :secretary_id, :null => false
      t.integer :neuropsychologist_id, :null => false

      t.timestamps
    end
  end
end

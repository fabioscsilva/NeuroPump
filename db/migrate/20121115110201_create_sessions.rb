class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :session_day, :null => false
      t.text :description
      t.references :patient
      t.references :secretary
      t.references :neuropsychologist

      t.timestamps
    end
  end
end

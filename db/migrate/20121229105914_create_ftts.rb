class CreateFtts < ActiveRecord::Migration
  def change
    create_table :ftt_results do |t|
      t.integer :test_phase
      t.integer :first
      t.integer :second
      t.integer :third
      t.integer :fourth
      t.integer :fifth
      t.integer :sixth
      t.integer :seventh
      t.integer :eighth
      t.integer :ninth
      t.integer :tenth
      t.text :observations
      t.references :appointment_plan

      t.timestamps
    end


 
  end
end

class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clock_results do |t|
      t.integer :screen_result
      t.integer :number_seq_result
      t.float :pointers_loc_result
      t.text :observations
      t.references :appointment_plan

      t.timestamps
    end
  end
end

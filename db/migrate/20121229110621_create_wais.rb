class CreateWais < ActiveRecord::Migration
  def change
    create_table :wais_results do |t|
      t.integer :phase
      t.time :spent_time
      t.integer :correct_items
      t.integer :wrong_items
      t.text :observations
      t.references :appointment_plan

      t.timestamps
    end

  end
end

class CreateTmts < ActiveRecord::Migration
  def change
    create_table :tmt_results do |t|
      t.integer :phase
      t.time :time
      t.text :observations
      t.references :appointment_plan

      t.timestamps
    end

  end
end

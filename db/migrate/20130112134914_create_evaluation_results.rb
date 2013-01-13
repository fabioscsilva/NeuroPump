class CreateEvaluationResults < ActiveRecord::Migration
  def change
    create_table :evaluation_results do |t|
      t.text :context
      t.text :conclusion
      t.text :solution
      t.references :appointment
      t.timestamps
    end
  end
end

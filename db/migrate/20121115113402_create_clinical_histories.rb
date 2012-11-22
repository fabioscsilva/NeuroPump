class CreateClinicalHistories < ActiveRecord::Migration
  def change
    create_table :clinical_histories do |t|
      t.string :description, :null => false
      t.integer :patient_id, :null => false
      t.timestamps
    end
  end
end

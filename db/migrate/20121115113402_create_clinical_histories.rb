class CreateClinicalHistories < ActiveRecord::Migration
  def change
    create_table :clinical_histories do |t|
      t.string :description, :null => false
      t.references :patient
      t.timestamps
    end
  end
end

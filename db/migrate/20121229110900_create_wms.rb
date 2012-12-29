class CreateWms < ActiveRecord::Migration
  def change
    create_table :wms do |t|
      t.integer :phase
      t.integer :correct_items
      t.integer :wrong_items
      t.text :observations

      t.timestamps
    end
  end
end

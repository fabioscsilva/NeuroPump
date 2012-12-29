class CreateWais < ActiveRecord::Migration
  def change
    create_table :wais do |t|
      t.integer :phase
      t.time :spent_time
      t.integer :correct_items
      t.integer :wrong_items
      t.text :observations

      t.timestamps
    end
  end
end

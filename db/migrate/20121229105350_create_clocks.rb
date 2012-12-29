class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.integer :screen_result
      t.integer :number_seq_result
      t.integer :pointers_loc_result
      t.text :observations

      t.timestamps
    end
  end
end

class CreateTmts < ActiveRecord::Migration
  def change
    create_table :tmts do |t|
      t.integer :phase
      t.time :time
      t.text :observations

      t.timestamps
    end
  end
end

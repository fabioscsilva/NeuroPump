class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :description, :null => false

      t.timestamps
    end
  end
end

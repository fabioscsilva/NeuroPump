class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.string :path, :null => false
      t.string :type, :null => false

      t.timestamps
    end
  end
end

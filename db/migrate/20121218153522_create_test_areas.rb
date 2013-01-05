class CreateTestAreas < ActiveRecord::Migration
  def change
    create_table :test_areas do |t|
      t.string :name
      t.timestamps
    end
  end
end

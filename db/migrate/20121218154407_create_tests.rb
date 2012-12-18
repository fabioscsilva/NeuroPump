class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description
      t.references :test_area
      t.timestamps
    end
  end
end

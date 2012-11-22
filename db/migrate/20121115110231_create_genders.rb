class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :description, :null => false

      t.timestamps
    end
  end
end

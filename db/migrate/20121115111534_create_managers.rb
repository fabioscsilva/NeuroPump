class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :telephone
      t.string :mobilephone
      t.references :gender
      t.references :clinic
      t.references :login

      t.timestamps
    end
  end
end

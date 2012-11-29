class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :payment_date
      t.datetime :due_date, :null => false
      t.datetime :creation_date, :null => false
      t.string :reference, :null => false
      t.decimal :value, :null => false
      t.boolean :payed, :default => false
      t.references :clinic

      t.timestamps
    end
   end
end

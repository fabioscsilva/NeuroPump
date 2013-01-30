class AddEntityToPayments < ActiveRecord::Migration
  def change
  	add_column :payments, :entity, :string
  end
end

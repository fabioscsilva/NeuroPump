class CreateCivilStatuses < ActiveRecord::Migration
  def change
    create_table :civil_statuses do |t|
      t.string :description, :null => false

      t.timestamps
    end
  end
end

class AddColumns < ActiveRecord::Migration
  def change

    add_column :patients, :education, :string
    add_column :patients, :profession, :string
    
  end
end

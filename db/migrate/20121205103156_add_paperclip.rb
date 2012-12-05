class AddPaperclip < ActiveRecord::Migration
  def change
  	remove_column :neuropsychologists, :photo
  	add_attachment :neuropsychologists, :photo
  	remove_column :patients, :photo
  	add_attachment :patients, :photo
  	remove_column :secretaries, :photo
  	add_attachment :secretaries, :photo
  end
end

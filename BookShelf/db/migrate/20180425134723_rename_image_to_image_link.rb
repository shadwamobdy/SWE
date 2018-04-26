class RenameImageToImageLink < ActiveRecord::Migration
  	def change
  		rename_column :books, :image, :image_link
  	end
end

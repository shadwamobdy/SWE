class ChangeIsbnToBeUniqueInBooks < ActiveRecord::Migration
  def change
  	add_index :books, :isbn, unique: true
  end
end

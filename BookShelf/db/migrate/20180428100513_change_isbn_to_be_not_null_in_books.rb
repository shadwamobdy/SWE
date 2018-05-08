class ChangeIsbnToBeNotNullInBooks < ActiveRecord::Migration
  def change
  	change_column_null(:books, :isbn, false)
  end
end

class CreateAuthers < ActiveRecord::Migration
  def change
    create_table :authers do |t|
      t.string :name
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end

   	add_index :authers, [:book_id, :name], unique: true
  end
end

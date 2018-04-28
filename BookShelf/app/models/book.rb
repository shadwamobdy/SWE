class Book < ActiveRecord::Base
	has_many :authors, class_name: "Auther", foreign_key: "book_id"
end

class Book < ActiveRecord::Base
	has_many :authors, class_name: "Auther", foreign_key: "book_id"
	validates :isbn, presence: true
	validates_uniqueness_of :isbn
	def index 
		
	end
end

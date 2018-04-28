class Book < ActiveRecord::Base
	validates :isbn, presence: true
	validates :created_at, presence: true 
	validates :updated_at, presence: true 
	validates_uniqueness_of :updated_at
	def index 
		
	end
end

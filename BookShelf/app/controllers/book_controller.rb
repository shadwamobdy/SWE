class BookController < ApplicationController

	def show
		#@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		
	end

	private 
		def book_params
			params[:book].permit(:title, :description, :image, :category)
		end

end

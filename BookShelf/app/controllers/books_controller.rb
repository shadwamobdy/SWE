class BooksController < ApplicationController

	def show
		#@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create

		@book = Book.new(book_params)
		if @book.save!
			authors = params[:book][:authors]
			authors.shift
			authors.each do |a|
				auther = Auther.new(:name => a, :book => @book)
				if !auther.save!
                    puts "Error: Auther not saved"
                end
			end
			redirect_to admin_path
		end
	end

	private 
		def book_params
			params[:book].permit(:isbn, :title, :description, :image_link, :category)
		end

end

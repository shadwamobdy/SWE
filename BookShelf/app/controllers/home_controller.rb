class HomeController < ApplicationController

	before_filter :admin
  
  	def index
  		@books = Hash.new
  		@categories = ["Art", "Sports", "Business", "Advanture", "Poetry", "Economics", "Science", "Fiction",
  		 			   "Education", "Computers", "Language", "Philosophy"]
  		@admin = false
  		@categories.each do |c|
  			@books[c] = Book.where(category: c)
  			if !@books[c].any?
  				@books[c] = GoogleBooks.search("subject: #{c}")
  				puts "----------------------> size #{@books[c].any?} category #{c}"
  				@books[c].each do |b|
  					book = Book.new(:title => b.title, :description => b.description, :image_link => b.image_link, :category => c)
  					if !book.save!
  						puts "Error: Book not saved"
  					end
  				end
  			end
  		end
  	end

  	def search
  		filter = params[:filter]
  		if !(filter)
  			
  		else
  			 
  		end
  			
  	end

  	def admin
  		@admin = true
   	end
  
end

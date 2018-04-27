class HomeController < ApplicationController

	before_filter :admin
  
  	def index
  		@books = Hash.new
  		@categories = ["Art", "Sports", "Business", "Advanture", "Poetry", "Economics", "Science", "Fiction",
  		 			   "Education", "Computers", "Language", "Philosophy"]
  		@admin = false
  		@categories.each do |c|
  			
  			if not Book.exists?(["category like ?", "%#{c}%"])
  				@books[c] = GoogleBooks.search("subject: #{c}")
  				puts "----------------------> size #{@books[c].any?} category #{c}"
  				@books[c].each do |b|
  					book = Book.new(:title => b.title, :description => b.description, :image_link => b.image_link, :category => c)
  					if !book.save!
  						puts "Error: Book not saved"
  					end
  				end
  			end
  			@books[c] = Book.where(category: c).limit(5)
  		end
  	end

  	def search
  		filter = params[:filter]
  		@attribute = params[:search]
  		if filter == "name"
  			if not Book.exists?(["lower(title) like ?", "%#{@attribute.downcase}%"])
  				books = GoogleBooks.search(@attribute, {:count => 30})
  				books.each do |b|
  					book = Book.new(:title => b.title, :description => b.description, :image_link => b.image_link, :category => b.categories.first)
  					if !book.save!
  						puts "Error: Book not saved"
  					end
  				end
  			end
  			@books = Book.where("lower(title) like ?", "%#{@attribute.downcase}%")
  		elsif filter == "category"
  			if not Book.exists?(["lower(category) like ?", "%#{@attribute.downcase}%"])
  			puts "opaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  				books = GoogleBooks.search("subject: #{@attribute}", {:count => 30})
  				books.each do |b|
  					book = Book.new(:title => b.title, :description => b.description, :image_link => b.image_link, :category => @attribute)
  					if !book.save!
  						puts "Error: Book not saved"
  					end
  				end
  			end
  			@books = Book.where("lower(category) like ?", "%#{@attribute.downcase}%")
  		end
  	end

  	def admin
  		@admin = true
   	end
  
end

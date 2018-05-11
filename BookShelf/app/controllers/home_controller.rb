class HomeController < ApplicationController

	before_filter :admin
  
  	def index
      @user_session = UserSession.new
  		@books = Hash.new
  		@categories = ["Art", "Sports", "Business", "Advanture", "Poetry", "Economics", "Science", "Fiction",
  		 			   "Education", "Computers", "Language", "Philosophy"]
  		@admin = false
  		@categories.each do |c|
  			
  			if not Book.exists?(["category like ?", "%#{c}%"]) or Book.where(:category => c).count < 5
  				@books[c] = GoogleBooks.search("subject: #{c}", {:count => 30})
  				@books[c].each do |b|
  					if not b.isbn or Book.exists?(["isbn like ?", b.isbn])
  						next
  					end
  					book = Book.new(:isbn => b.isbn, :title => b.title, :description => b.description, :image_link => b.image_link, :category => c)
  					if !book.save!
  						puts "Error: Book not saved"
  					else 
  						b.authors_array.each do |a|
  							auther = Auther.new(:name => a, :book => book)
  							if !auther.save!
  								puts "Error: Auther not saved"
  							end
  						end
  					end
  				end
  			end
  			@books[c] = Book.where(category: c).limit(5)
  		end
  	end

  	def search
  		@admin = false
  		@filter = params[:filter]
  		@attribute = params[:search]
  		if @filter == "name"
  			if not Book.exists?(["lower(title) like ?", "%#{@attribute.downcase}%"])
  				books = GoogleBooks.search("intitle: #{@attribute}", {:count => 30})
  				books.each do |b|
  					if not b.isbn or Book.exists?(["isbn like ?", b.isbn])
  						next
  					end
  					book = Book.new(:isbn => b.isbn, :title => b.title, :description => b.description, :image_link => b.image_link, :category => b.categories.first)
  					if !book.save!
  						puts "Error: Book not saved"
  					else 
  						b.authors_array.each do |a|
  							auther = Auther.new(:name => a, :book => book)
  							if !auther.save!
  								puts "Error: Auther not saved"
  							end
  						end
  					end
  				end
  			end
  			@books = Book.where("lower(title) like ?", "%#{@attribute.downcase}%")
  		elsif @filter == "category"
  			if not Book.exists?(["lower(category) like ?", "%#{@attribute.downcase}%"])
  				books = GoogleBooks.search("subject: #{@attribute}", {:count => 30})
  				books.each do |b|
  					if not b.isbn or Book.exists?(["isbn like ?", b.isbn])
  						next
  					end
  					book = Book.new(:isbn => b.isbn, :title => b.title, :description => b.description, :image_link => b.image_link, :category => @attribute)
  					if !book.save!
  						puts "Error: Book not saved"
  					else 
  						b.authors_array.each do |a|
  							auther = Auther.new(:name => a, :book => book)
  							if !auther.save!
  								puts "Error: Auther not saved"
  							end
  						end
  					end
  				end
  			end
  			@books = Book.where("lower(category) like ?", "%#{@attribute.downcase}%")
  		end
  	end

  	def admin
  		@book = Book.new
        @authors = Auther.all
        @books = Hash.new
        @categories = ["Art", "Sports", "Business", "Advanture", "Poetry", "Economics", "Science", "Fiction",
                       "Education", "Computers", "Language", "Philosophy"]
        @admin = false
        @categories.each do |c|
            
            if not Book.exists?(["category like ?", "%#{c}%"]) or Book.where(:category => c).count < 5
                @books[c] = GoogleBooks.search("subject: #{c}", {:count => 30})
                @books[c].each do |b|
                    if not b.isbn or Book.exists?(["isbn like ?", b.isbn])
                        next
                    end
                    book = Book.new(:isbn => b.isbn, :title => b.title, :description => b.description, :image_link => b.image_link, :category => c)
                    if !book.save!
                        puts "Error: Book not saved"
                    else 
                        b.authors_array.each do |a|
                            auther = Auther.new(:name => a, :book => book)
                            if !auther.save!
                                puts "Error: Auther not saved"
                            end
                        end
                    end
                end
            end
            @books[c] = Book.where(category: c).limit(5)
        end
   	end
  
end

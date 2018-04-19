class HomeController < ApplicationController

	before_filter :admin
  
  	def index
  		@admin = false
  	end

  	def search
  	end

  	def admin
  		@admin = true
   	end
  
end

class User < ActiveRecord::Base
	acts_as_authentic
	validates :user_name, presence: true
	validates :crypted_password, presence: true
	validates :email, presence: true
	validates_uniqueness_of :email
	
end

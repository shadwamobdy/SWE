class User < ActiveRecord::Base
	acts_as_authentic
	validates :user_name, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates_uniqueness_of :email
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

def setup
	@user = User.new(user_name: "salma", email: "salma@gmail.com", crypted_password: "1111")
end

test "user name should be present" do
	@user.user_name = " "
	assert_not @user.valid?
end

test "user password should be present" do
	@user.crypted_password = " "
	assert_not @user.valid?
end

test "user email should be present" do
	@user.email = " "
	assert_not @user.valid?
end

test "user email should be unique" do
	@user.save
	user2 = User.new(user_name: "shadwa", email: "salma@gmail.com", crypted_password: "2222")
	assert_not user2.valid?
end

end

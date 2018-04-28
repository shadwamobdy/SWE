require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

def setup
	@book = Book.new(isbn: "123458", created_at: "2018-04-26 14:53:04.539940", updated_at: "2018-04-26 14:53:04.539940")
end

test "book should be valid" do
	assert @book.valid?
end

test "book ISBN should be present" do
	@book.isbn = " "
	assert_not @book.valid?
end

test "book ISBN should be unique" do
	@book.save
	book2 = Book.new(isbn: "123456")
	assert_not book2.valid?
end

test "book created_at should be present" do
	@book.created_at = " "
	assert_not @book.valid?
end

test "book updated_at should be present" do
	@book.updated_at = " "
	assert_not @book.valid?
end

end
